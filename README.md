# badgerkit

[![Gem Version](http://img.shields.io/gem/v/badgerkit.svg)][gem]
[![Build Status](http://img.shields.io/travis/badgerhq/badgerkit.rb.svg)][travis]
[![Coverage Status](http://img.shields.io/coveralls/badgerhq/badgerkit.rb.svg)][coveralls]
[![Code Climate](http://img.shields.io/codeclimate/github/badgerhq/badgerkit.rb.svg)][codeclimate]
[![Dependency Status](http://img.shields.io/gemnasium/badgerhq/badgerkit.rb.svg)][gemnasium]

[gem]: https://rubygems.org/gems/badgerkit
[travis]: http://travis-ci.org/badgerhq/badgerkit.rb
[coveralls]: https://coveralls.io/r/badgerhq/badgerkit.rb
[codeclimate]: https://codeclimate.com/github/badgerhq/badgerkit.rb
[gemnasium]: https://gemnasium.com/badgerhq/badgerkit.rb

Simple api wrapper for submitting data to https://badgerhq.com

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'badgerkit', :group => [:development, :test]
```

And then execute:
```
$ bundle
````

## Usage

Without environment variables:

```ruby
client = Badgerkit.new(
  :access_token => '0dbce1478e94053d4282ccd4ace154c82a3475d5',
  :source       => 'github',
  :repo         => 'badgerhq/badgerkit.rb'
)

client.post('Documentation',
  :value       => 80,
  :commit_sha1 => '0dbce1478e94053d4282ccd4ace154c82a3475d5',
  :branch      => 'master',
  :archive     => Badgerkit.archive('doc/')
)
```

With the following environment variables:

```ruby
ENV['BADGER_ACCESS_TOKEN'] = '0dbce1478e94053d4282ccd4ace154c82a3475d5'
ENV['BADGER_SOURCE']       = 'github'
ENV['BADGER_REPO']         = 'badgerhq/badgerkit.rb'

Badgerkit.post('Documentation',
  :value       => 80,
  :commit_sha1 => '0dbce1478e94053d4282ccd4ace154c82a3475d5',
  :branch      => 'master',
  :archive     => Badgerkit.archive('doc/')
)
```

## Supported Ruby Versions

This library is tested against Travis and aims to support the following Ruby
implementations:

* Ruby 1.9.3
* Ruby 2.0.0
* Ruby 2.1.1

## Contributing

1. Fork it ( http://github.com/<my-github-username>/badgekit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

---

<a href="https://badgerhq.com"><img src="https://d87fcfg6nirfp.cloudfront.net/logo-medium.png" height="40"></a>
