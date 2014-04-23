# Badgerkit

[![Gem Version](http://img.shields.io/gem/v/badgerkit.svg)][gem]
[![Build Status](http://img.shields.io/travis/saladdays-nl/badgerkit.rb.svg)][travis]
[![Coverage Status](http://img.shields.io/coveralls/saladdays-nl/badgerkit.rb.svg)][coveralls]
[![Code Climate](http://img.shields.io/codeclimate/github/saladdays-nl/badgerkit.rb.svg)][codeclimate]
[![Dependency Status](http://img.shields.io/gemnasium/saladdays-nl/badgerkit.rb.svg)][gemnasium]

[gem]: https://rubygems.org/gems/badgerkit
[travis]: http://travis-ci.org/saladdays-nl/badgerkit.rb
[coveralls]: https://coveralls.io/r/saladdays-nl/badgerkit.rb
[codeclimate]: https://codeclimate.com/github/saladdays-nl/badgerkit.rb
[gemnasium]: https://gemnasium.com/saladdays-nl/badgerkit.rb

Simple api wrapper for submitting data to http://badgerhq.com

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

```ruby
Badgerkit::Client.new(
  :source => 'github'
  :repo   => 'saladdays-nl/badgerkit.rb'
  :name   => 'Ruby documentation'
).post(
  :value       => 80,
  :commit_sha1 => '0dbce1478e94053d4282ccd4ace154c82a3475d5',
  :branch      => 'master'
)
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/badgekit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
