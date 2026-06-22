## Unreleased

* Added support for `Cache-Control: stale-while-revalidate`.
* Added `:on_stale` middleware callback hook to trigger custom background refresh logic when stale cached responses are served.

## [2.7.0](https://github.com/matthutchinson/faraday-http-cache/compare/v2.7.0...v2.7.0) (2026-06-22)


### Bug Fixes

* release-please version-file config and workflow API key auth ([4fd5dd3](https://github.com/matthutchinson/faraday-http-cache/commit/4fd5dd3400740b8ca8bfbf040cd570171b18bc8b))
* rubocop gem order and target ruby version ([d1b946d](https://github.com/matthutchinson/faraday-http-cache/commit/d1b946d7cc35fe9157178c3b17d48eb4c228d695))
* rubocop offenses for Ruby 3.2 target ([b223c50](https://github.com/matthutchinson/faraday-http-cache/commit/b223c505aad238afd7cfdbd9d211ef6a040c121c))
* update test server for Rack 3.x compatibility ([77f228b](https://github.com/matthutchinson/faraday-http-cache/commit/77f228bb4ce619da9ab6c7cf439c71788b55ac05))
* use API key for RubyGems publish instead of OIDC trusted publishing ([dd859d2](https://github.com/matthutchinson/faraday-http-cache/commit/dd859d24a11a0f873a88cf496ad5f2f41153c9d7))
* use unique and sorted headers from the vary header ([32243c1](https://github.com/matthutchinson/faraday-http-cache/commit/32243c13573e4868d3cd70890343a59b50d8234f))


### Miscellaneous

* add release-please for automated releases to RubyGems ([3e0f9ff](https://github.com/matthutchinson/faraday-http-cache/commit/3e0f9ff2a132438dda0c4980133a8cddf15a448d))
* bump to 2.6.0, require Ruby 3.2+ ([9227f0c](https://github.com/matthutchinson/faraday-http-cache/commit/9227f0c967c739f761bce3c0c2b6e0e58dbe18cb))
* bump to 2.6.1 ([198a590](https://github.com/matthutchinson/faraday-http-cache/commit/198a590425b243354038e26b456d00004f1f562d))
* **main:** release 2.7.0 ([#140](https://github.com/matthutchinson/faraday-http-cache/issues/140)) ([7149226](https://github.com/matthutchinson/faraday-http-cache/commit/71492262f888e2e6fbe5dd3c975551bd362420d2))
* release 2.7.0 ([a79c386](https://github.com/matthutchinson/faraday-http-cache/commit/a79c386a882b6a4a4ca0f3903794cc5619d7a705))
* update dependencies and CI to modern versions ([dd8418b](https://github.com/matthutchinson/faraday-http-cache/commit/dd8418b8876ea3367c070f86c3954d017f8f5eba))


### Continuous Integration

* Drop unused Travis setting ([1068c85](https://github.com/matthutchinson/faraday-http-cache/commit/1068c850491e1df59c647966d99fcc4bdb0f8700))

## [2.7.0](https://github.com/sourcelevel/faraday-http-cache/compare/v2.6.1...v2.7.0) (2026-04-14)


### Miscellaneous

* add release-please for automated releases to RubyGems ([3e0f9ff](https://github.com/sourcelevel/faraday-http-cache/commit/3e0f9ff2a132438dda0c4980133a8cddf15a448d))
* release 2.7.0 ([a79c386](https://github.com/sourcelevel/faraday-http-cache/commit/a79c386a882b6a4a4ca0f3903794cc5619d7a705))

## 2.5.1 (2024-01-16)

* Support headers passed in using string keys when Vary header is in a different case via #137 (thanks @evman182)

## 2.5.0 (2023-04-27)

* Add `reason_phrase` from the HTTP response to the data stored in the cache according to [RFC7230](https://www.rfc-editor.org/rfc/rfc7230#section-3.1.2) via [#134](https://github.com/sourcelevel/faraday-http-cache/pull/134)

## 2.4.1 (2022-08-08)

* Require `Logger` in `BaseStrategy` via [#131](https://github.com/sourcelevel/faraday-http-cache/pull/131)
* Use unique and sorted headers from the Vary header in `ByVary` strategy via [#132](https://github.com/sourcelevel/faraday-http-cache/pull/132)

## 2.4.0 (2022-06-07)

* Introduced a new `strategy` option to support different cache storage strategies.
* The original strategy moved from `Faraday::HttpCache::Storage` to `Faraday::HttpCache::Strategies::ByUrl`.
* The new `Faraday::HttpCache::Strategies::ByVary` strategy uses headers from `Vary` header to generate cache keys. It also uses the index with `Vary` headers mapped to the request URL.
* `Faraday::HttpCache::Storage` class deprecated.

## 2.3.0 (2022-05-25)

* Added support for Ruby 3.0, 3.1.
* Ruby version constraint changed to 2.4.0.

## 2.2.0 (2019-04-13)

* Support for faraday 1.x

## 2.0.0 (2016-11-16)

* Ruby version constraint changed to 2.1.0.
* Changed `Faraday::HttpCache#initialize` to use keyword arguments instead of
a `Hash`.

## 1.3.1 (2016-08-12)

* Reject invalid `Date` response headers instead of letting the exception bubble.

## 1.3.0 (2016-03-24)

* `no-cache` responses won't be treated as fresh and will always be revalidated.

## 1.2.2 (2015-08-27)

* Update the `CACHE_STATUSES` to properly instrument requests with the `Cache-Control: no-store` header.

## 1.2.1

* Update the `CACHE_STATUSES` to better instrument `invalid` and `uncacheable` responses.

## 1.2.0 (2015-08-14)

* Deprecate the default instrumenter name `process_request.http_cache.faraday`
in favor of `http_cache.faraday`.

## 1.1.1 (2015-06-04)

* Added support for `:instrumenter_name` option.
* 307 responses (`Temporary Redirects`) are now cached.
* Do not crash on non RFC 2616 compliant `Expires` headers.

## 1.1.0 (2015-04-02)

* Instrumentation supported. (by @dasch)
* Illegal headers from `304` responses will be removed before updating the
cached responses. (by @dasch)

## 1.0.1 (2015-01-30)

* Fixed HTTP method matching that failed when using the `Marshal` serializer.
(by @toddmazierski)

## 1.0.0 (2015-01-27)

* Deprecated configuration API removed.
* Better support for the caching mechanisms described in the RFC 7234, including:
  * Reworked the data structures that are stored in the underlying store to
  store responses under the same URL and HTTP method.
  * Cached responses are invalidated after a `PUT`/`POST`/`DELETE` request.
  * Support for the `Vary` header as a second logic to retrieve a stored response.

## 0.4.2 (2014-08-17)

* Header values are explicitly part of the cache key for all requests.

## 0.4.1 (2014-06-26)

* Encoding conversion exceptions will emit a log warning before raising through
the middleware stack. Use `Marshal` instead of `JSON` to serialize such requests.
* Compatible with latest ActiveSupport and Faraday versions.

## 0.4.0 (2014-01-30)
