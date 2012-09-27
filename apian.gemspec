# -*- encoding: utf-8 -*-
require File.expand_path('../lib/apian/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mike Butsko"]
  gem.email         = ["butsko.7@osu.edu"]
  gem.summary       = %q{Activerecord model mixin that provides api functionality to services.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "apian"
  gem.require_paths = ["lib"]
  gem.version       = Apian::VERSION

  gem.add_dependency 'rails'
end
