# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uberscore/version'

Gem::Specification.new do |spec|
  spec.name          = "uberscore"
  spec.version       = Uberscore::VERSION
  spec.authors       = %w(Ox0dea shock_one)
  spec.summary       = %q{A gem that makes your Ruby blocks more concise.}
  spec.description   = %q{A gem that makes your Ruby blocks more concise.}
  spec.homepage      = "https://github.com/shockone/uberscore"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
