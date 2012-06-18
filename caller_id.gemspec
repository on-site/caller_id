# -*- encoding: utf-8 -*-
require File.expand_path('../lib/caller_id/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ben Ellis"]
  gem.email         = ["bellis@on-site.com"]
  gem.description   = %q{Ruby wrapper for OpenCNAM}
  gem.summary       = %q{Do reverse phone lookups via OpenCNAM ( http://www.opencnam.com/ )}
  gem.homepage      = "https://github.com/on-site/caller_id"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "caller_id"
  gem.require_paths = ["lib"]
  gem.version       = CallerId::VERSION

  gem.add_development_dependency "bundler", ">= 1.0.0"
  gem.add_development_dependency "rspec", "~> 2.6"
  gem.add_development_dependency "vcr", "~> 2.1"
  gem.add_development_dependency "webmock", "1.8.6"
  gem.add_development_dependency "timecop", "~> 0.3"

  gem.add_dependency "json"

end
