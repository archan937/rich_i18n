# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rich/i18n/version"

Gem::Specification.new do |s|
  s.name        = "rich_i18n"
  s.version     = Rich::I18n::VERSION::STRING
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Paul Engel"]
  s.email       = ["paul.engel@holder.nl"]
  s.homepage    = "http://codehero.es/rails_gems_plugins/rich_i18n"
  s.summary     = %q{Enrichments (e9s) module for internationalization (i18n)}
  s.description = %q{Rich-i18n is a module of E9s (http://github.com/archan937/e9s) which enriches I18n, SimpleForm / Formtastic, the String and Symbol classes. This simplifies internationalization of your Rails application making a Rails developers life much easier.}

  s.rubyforge_project = "rich_i18n"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rich_support", "~> 0.1.0"
  s.add_dependency "rich_cms"    , "~> 3.1.0"
  s.add_dependency "gem_suit"    , "~> 0.1.0"
  s.add_dependency "jzip"        , "~> 1.1.0"
  s.add_dependency "haml"        , "~> 3.0.25"
  s.add_dependency "hpricot"
  s.add_dependency "i18n"
end