# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hl7/exporter/version'

Gem::Specification.new do |spec|
  spec.name          = "hl7-exporter"
  spec.version       = Hl7::Exporter::VERSION
  spec.authors       = ["Enrique Carlos Mogollan"]
  spec.email         = ["emogollan@gmail.com"]
  spec.summary       = %q{A library to export messages from the ruby-hl7 gem}
  spec.description   = %q{A simple library to export messages from the ruby-hl7 gem}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
