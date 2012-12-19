# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'crowdbase/version'

Gem::Specification.new do |gem|
  gem.name          = "crowdbase2"
  gem.version       = Crowdbase::VERSION
  gem.authors       = ["Simon Prévost"]
  gem.email         = ["simonprevost@gmail.com"]
  gem.description   = %q{Ruby wrapper for the Crowdbase API}
  gem.summary       = %q{Ruby wrapper for the Crowdbase API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "her"
  gem.add_development_dependency "rake"
end
