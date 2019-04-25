# token-endpoint-ruby

⚠️ **Deprecation Notice (2019-04-24)** ⚠️ This gem is deprecated in favor of [indieweb/indieweb-endpoints-ruby](https://github.com/indieweb/indieweb-endpoints-ruby) and will no longer receive updates.

---

**A Ruby gem for discovering a URL’s [token endpoint](https://indieweb.org/token-endpoint) for use with [Micropub](https://indieweb.org/Micropub) and [IndieAuth](https://indieweb.org/IndieAuth) clients.**

[![Gem](https://img.shields.io/gem/v/token-endpoint.svg?style=for-the-badge)](https://rubygems.org/gems/token-endpoint)
[![Downloads](https://img.shields.io/gem/dt/token-endpoint.svg?style=for-the-badge)](https://rubygems.org/gems/token-endpoint)
[![Build](https://img.shields.io/travis/com/jgarber623/token-endpoint-ruby/master.svg?style=for-the-badge)](https://travis-ci.com/jgarber623/token-endpoint-ruby)
[![Dependencies](https://img.shields.io/depfu/jgarber623/token-endpoint-ruby.svg?style=for-the-badge)](https://depfu.com/github/jgarber623/token-endpoint-ruby)
[![Maintainability](https://img.shields.io/codeclimate/maintainability/jgarber623/token-endpoint-ruby.svg?style=for-the-badge)](https://codeclimate.com/github/jgarber623/token-endpoint-ruby)
[![Coverage](https://img.shields.io/codeclimate/c/jgarber623/token-endpoint-ruby.svg?style=for-the-badge)](https://codeclimate.com/github/jgarber623/token-endpoint-ruby/code)

## Key Features

- Uses the same discovery algorithm outlined in [Section 5.3](https://www.w3.org/TR/micropub/#endpoint-discovery) of [the W3C's Micropub Recommendation](https://www.w3.org/TR/micropub/).
- Supports Ruby 2.4 and newer.

## Getting Started

Before installing and using token-endpoint-ruby, you'll want to have [Ruby](https://www.ruby-lang.org) 2.4 (or newer) installed. It's recommended that you use a Ruby version managment tool like [rbenv](https://github.com/rbenv/rbenv), [chruby](https://github.com/postmodern/chruby), or [rvm](https://github.com/rvm/rvm).

token-endpoint-ruby is developed using Ruby 2.4.6 and is additionally tested against Ruby 2.5.5 and 2.6.2 using [Travis CI](https://travis-ci.com/jgarber623/token-endpoint-ruby).

## Installation

If you're using [Bundler](https://bundler.io), add token-endpoint-ruby to your project's `Gemfile`:

```ruby
source 'https://rubygems.org'

gem 'token-endpoint'
```

…and hop over to your command prompt and run…

```sh
$ bundle install
```

## Usage

### Basic Usage

With token-endpoint-ruby added to your project's `Gemfile` and installed, you may discover a URL's token endpoint by doing:

```ruby
require 'token-endpoint'

endpoint = TokenEndpoint.discover('https://aaronparecki.com')

puts endpoint # returns String: 'https://aaronparecki.com/auth'
```

This example will search `https://aaronparecki.com` for a valid token endpoint using the same rules described in [the W3C's Micropub Recommendation](https://www.w3.org/TR/micropub/#endpoint-discovery). In this case, the program returns a string: `https://aaronparecki.com/auth/token`.

If no endpoint is discovered at the provided URL, the program will return `nil`:

```ruby
require 'token-endpoint'

endpoint = TokenEndpoint.discover('https://example.com')

puts endpoint.nil? # returns Boolean: true
```

### Advanced Usage

Should the need arise, you may work directly with the `TokenEndpoint::Client` class:

```ruby
require 'token-endpoint'

client = TokenEndpoint::Client.new('https://aaronparecki.com')

puts client.response # returns HTTP::Response
puts client.endpoint # returns String: 'https://aaronparecki.com/auth/token'
```

### Exception Handling

There are several exceptions that may be raised by token-endpoint-ruby's underlying dependencies. These errors are raised as subclasses of `TokenEndpoint::Error` (which itself is a subclass of `StandardError`).

From [jgarber623/absolutely](https://github.com/jgarber623/absolutely) and  [sporkmonger/addressable](https://github.com/sporkmonger/addressable):

- `TokenEndpoint::InvalidURIError`

From [httprb/http](https://github.com/httprb/http):

- `TokenEndpoint::ConnectionError`
- `TokenEndpoint::TimeoutError`
- `TokenEndpoint::TooManyRedirectsError`

## Contributing

Interested in helping improve token-endpoint-ruby? Awesome! Your help is greatly appreciated. See [CONTRIBUTING.md](https://github.com/jgarber623/token-endpoint-ruby/blob/master/CONTRIBUTING.md) for details.

## Acknowledgments

token-endpoint-ruby wouldn't exist without Micropub and the hard work put in by everyone involved in the [IndieWeb](https://indieweb.org) movement.

token-endpoint-ruby is written and maintained by [Jason Garber](https://sixtwothree.org).

## License

token-endpoint-ruby is freely available under the [MIT License](https://opensource.org/licenses/MIT). Use it, learn from it, fork it, improve it, change it, tailor it to your needs.
