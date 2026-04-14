require 'rubygems'
require 'bundler/setup'

require 'faraday/http_cache'
require 'active_support'
require 'active_support/logger'

backend = Faraday::Adapter::Test::Stubs.new
upstream_version = 1
refresh_threads = []

client = nil

on_stale = lambda do |request:, env:, cached_response:|
  request && env && cached_response

  puts "  stale cache hit for #{request.url.path}, scheduling refresh"

  refresh_threads << Thread.new do
    client.get(request.url.path, nil, 'Cache-Control' => 'no-cache')
  end
end

client = Faraday.new do |stack|
  stack.use :http_cache, logger: ActiveSupport::Logger.new($stdout), on_stale: on_stale
  stack.adapter :test, backend
end

backend.get('/resource') do |env|
  if env.request_headers['If-None-Match'] == upstream_version.to_s
    [304, {}, '']
  else
    headers = {
      'Cache-Control' => 'public, max-age=0, stale-while-revalidate=60',
      'Date' => Time.now.httpdate,
      'ETag' => upstream_version.to_s
    }
    [200, headers, "upstream-version-#{upstream_version}"]
  end
end

puts 'Request #1 (cache miss)'
response = client.get('/resource')
puts "  body: #{response.body}"
puts

upstream_version = 2

puts 'Request #2 (served stale + refresh runs in background)'
response = client.get('/resource')
puts "  body: #{response.body}"
puts

refresh_threads.each(&:join)

puts 'Request #3 (sees refreshed cache entry)'
response = client.get('/resource')
puts "  body: #{response.body}"
