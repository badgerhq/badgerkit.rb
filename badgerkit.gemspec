# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'badgerkit/version'

Gem::Specification.new do |spec|
  spec.name          = "badgerkit"
  spec.version       = Badgerkit::VERSION
  spec.authors       = ["Johan van Zonneveld"]
  spec.email         = ["johan@vzonneveld.nl"]
  spec.summary       = "Toolkit for badgerhq.com"
  spec.description   = "Simple api wrapper for submitting data to badgerhq.com"
  spec.homepage      = "https://github.com/saladdays-nl/badgerkit.rb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'rspec', '>= 2.3'

  spec.add_dependency "httmultiparty"
  spec.add_dependency "hashie"
  spec.add_dependency 'rubyzip', '>= 1.0.0'
  spec.add_dependency 'zip-zip'
end
