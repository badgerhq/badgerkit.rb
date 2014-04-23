# Badgerkit

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'badgekit', :group => [:development, :test]
```

And then execute:
```
$ bundle
````

## Usage

```ruby
Badgekit::Client.new(
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
