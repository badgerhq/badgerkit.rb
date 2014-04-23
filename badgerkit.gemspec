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
  spec.description   = "Write a description"
  spec.homepage      = "https://github.com/saladdays-nl/badgerkit.rb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_dependency "httparty"
  spec.add_dependency "hashie"
end
