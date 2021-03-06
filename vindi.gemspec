# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vindi/version"

Gem::Specification.new do |spec|
  spec.name          = "vindi"
  spec.version       = Vindi::VERSION
  spec.authors       = %q{Vindi}
  spec.email         = %q{developers@vindi.com.br}
  spec.summary       = %q{Ruby toolkit for working with the Vindi API}
  spec.description   = %q{Simple wrapper for the Vindi API}
  spec.homepage      = 'https://github.com/vindi/vindi-ruby'
  spec.files         =  %w(README.md Rakefile vindi.gemspec)
  spec.files        +=  Dir.glob("lib/**/*.rb")
  spec.require_paths = ["lib"]


  spec.add_dependency 'faraday', '~> 1'
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
end
