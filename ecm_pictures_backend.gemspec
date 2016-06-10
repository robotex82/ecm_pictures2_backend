$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'ecm/pictures/backend/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'ecm_pictures2_backend'
  s.version     = Ecm::Pictures::Backend::VERSION
  s.authors     = ['Roberto Vasquez Angel']
  s.email       = ['roberto@vasquez-angel.de']
  s.homepage    = 'https://github.com/robotex82/ecm_pictures2_backend'
  s.summary     = 'Backend Module for ECM Pictures 2'
  s.description = 'Provides a ITSF Backend based Backend for ECM Pictures 2'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '>= 4.0'

  s.add_dependency 'ecm_news2'
  s.add_dependency 'itsf_backend'
  s.add_dependency 'jpeg_camera'
  s.add_dependency 'rails-i18n'
  s.add_dependency 'route_translator'
  s.add_dependency 'coffee-rails'
  s.add_dependency 'jquery-rails'

  s.add_development_dependency 'therubyracer'
  s.add_development_dependency 'rails-dummy'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'i18n-debug'

  s.add_development_dependency 'guard-bundler'
  s.add_development_dependency 'guard-rails'
end
