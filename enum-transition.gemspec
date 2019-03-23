$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enum/transition/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enum-transition"
  s.version     = Enum::Transition::VERSION
  s.authors     = ["Snm Maurya"]
  s.email       = ["snmmaurya@gmail.com"]
  s.homepage    = "https://www.github.com/snmmaurya/enum-transition"
  s.summary     = "Active Record ENUM based state machine"
  s.description = "Active Record ENUM based state machine, whether you can restrict status transition from one to other"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_development_dependency "rails", "~> 5.1.6", ">= 5.1.6.1"
  s.add_development_dependency "sqlite3", '~> 1.3', '>= 1.3.6'
end