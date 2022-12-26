require File.expand_path('../lib/omniauth-doorkeeper/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Joshua Hoskins']
  gem.email         = ['hello@crmified.com']
  gem.description   = 'OmniAuth strategy for Doorkeeper'
  gem.summary       = 'OmniAuth strategy for Doorkeeper'
  gem.homepage      = 'https://github.com/CRMified/omniauth-doorkeeper'

  gem.executables   = `git ls-files -- bin/*`.split('\n').map { |f| File.basename(f) }
  gem.files         = `git ls-files`.split('\n')
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split('\n')
  gem.name          = 'omniauth-timelyapp'
  gem.require_paths = ['lib']
  gem.version       = OmniAuth::Doorkeeper::VERSION
  gem.license       = 'MIT'

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '>= 1.3.1'
  gem.required_ruby_version = '>= 2.1.0'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
