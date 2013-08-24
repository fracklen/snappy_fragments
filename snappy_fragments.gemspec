# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'snappy_fragments/version'

Gem::Specification.new do |spec|
  spec.name          = "snappy_fragments"
  spec.version       = SnappyFragments::VERSION
  spec.authors       = ["Martin Neiiendam"]
  spec.email         = ["fracklen@gmail.com"]
  spec.description   = %q{Use snappy compression when storing fragment cache}
  spec.summary       = %q{snappy_fragments provide a utility method to store fragment cache using snappy compression}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "snappy"
  spec.add_development_dependency "rspec"

end
