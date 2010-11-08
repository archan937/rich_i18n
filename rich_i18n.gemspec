# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rich_i18n}
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Paul Engel"]
  s.date = %q{2010-11-08}
  s.description = %q{Rich-i18n is a module of E9s (http://github.com/archan937/e9s) which enriches I18n, Formtastic, the String and Symbol classes. This simplifies internationalization of your Rails application making a Rails developers life much easier.}
  s.email = %q{paul.engel@holder.nl}
  s.extra_rdoc_files = [
    "README.textile"
  ]
  s.files = [
    ".gitignore",
     "CHANGELOG",
     "MIT-LICENSE",
     "README.textile",
     "Rakefile",
     "VERSION",
     "app/views/rich_i18n.html.erb",
     "assets/jzip/jquery/core.jz",
     "assets/jzip/jquery/extensions/modules.js",
     "assets/jzip/jquery/seat_holder.js",
     "assets/jzip/rich.js",
     "assets/jzip/rich/i18n.js",
     "assets/jzip/rich_i18n.jz",
     "init.rb",
     "install.rb",
     "lib/generators/rich.rb",
     "lib/generators/rich/translation/templates/migration.rb",
     "lib/generators/rich/translation/templates/model.rb",
     "lib/generators/rich/translation/translation_generator.rb",
     "lib/rich/i18n.rb",
     "lib/rich/i18n/actionpack.rb",
     "lib/rich/i18n/actionpack/action_controller/base.rb",
     "lib/rich/i18n/actionpack/action_view/base.rb",
     "lib/rich/i18n/actionpack/action_view/sanitizor.rb",
     "lib/rich/i18n/activesupport.rb",
     "lib/rich/i18n/activesupport/active_support/dependencies.rb",
     "lib/rich/i18n/core.rb",
     "lib/rich/i18n/core/array.rb",
     "lib/rich/i18n/core/array/merging.rb",
     "lib/rich/i18n/core/enriched_string.rb",
     "lib/rich/i18n/core/object.rb",
     "lib/rich/i18n/core/object/enriched.rb",
     "lib/rich/i18n/core/string.rb",
     "lib/rich/i18n/core/string/enriched.rb",
     "lib/rich/i18n/core/string/html_safe.rb",
     "lib/rich/i18n/core/string/inflections.rb",
     "lib/rich/i18n/core/string/internationalization.rb",
     "lib/rich/i18n/core/symbol.rb",
     "lib/rich/i18n/core/symbol/internationalization.rb",
     "lib/rich/i18n/engine.rb",
     "lib/rich/i18n/formtastic.rb",
     "lib/rich/i18n/rails.rb",
     "lib/rich/i18n/rails/engine.rb",
     "lib/rich_i18n.rb",
     "locales/nl.yml",
     "rails/init.rb",
     "rails_generators/rich_i18n_translation/rich_i18n_translation_generator.rb",
     "rails_generators/rich_i18n_translation/templates/config.rb",
     "rails_generators/rich_i18n_translation/templates/migration.rb",
     "rails_generators/rich_i18n_translation/templates/model.rb",
     "rich_i18n.gemspec",
     "tasks/rich_i18n_tasks.rake",
     "test/rails-2/dummy/Gemfile",
     "test/rails-2/dummy/Gemfile.lock",
     "test/rails-2/dummy/Rakefile",
     "test/rails-2/dummy/app/controllers/application_controller.rb",
     "test/rails-2/dummy/app/helpers/application_helper.rb",
     "test/rails-2/dummy/config/boot.rb",
     "test/rails-2/dummy/config/database.yml",
     "test/rails-2/dummy/config/environment.rb",
     "test/rails-2/dummy/config/environments/development.rb",
     "test/rails-2/dummy/config/environments/production.rb",
     "test/rails-2/dummy/config/environments/test.rb",
     "test/rails-2/dummy/config/initializers/backtrace_silencers.rb",
     "test/rails-2/dummy/config/initializers/cookie_verification_secret.rb",
     "test/rails-2/dummy/config/initializers/inflections.rb",
     "test/rails-2/dummy/config/initializers/mime_types.rb",
     "test/rails-2/dummy/config/initializers/new_rails_defaults.rb",
     "test/rails-2/dummy/config/initializers/session_store.rb",
     "test/rails-2/dummy/config/locales/en.yml",
     "test/rails-2/dummy/config/preinitializer.rb",
     "test/rails-2/dummy/config/routes.rb",
     "test/rails-2/dummy/db/seeds.rb",
     "test/rails-2/dummy/db/test.sqlite3",
     "test/rails-2/dummy/log/development.log",
     "test/rails-2/dummy/log/production.log",
     "test/rails-2/dummy/log/server.log",
     "test/rails-2/dummy/log/test.log",
     "test/rails-2/dummy/public/404.html",
     "test/rails-2/dummy/public/422.html",
     "test/rails-2/dummy/public/500.html",
     "test/rails-2/dummy/public/favicon.ico",
     "test/rails-2/dummy/public/images/rails.png",
     "test/rails-2/dummy/public/index.html",
     "test/rails-2/dummy/public/javascripts/application.js",
     "test/rails-2/dummy/public/javascripts/controls.js",
     "test/rails-2/dummy/public/javascripts/dragdrop.js",
     "test/rails-2/dummy/public/javascripts/effects.js",
     "test/rails-2/dummy/public/javascripts/prototype.js",
     "test/rails-2/dummy/public/robots.txt",
     "test/rails-2/dummy/script/about",
     "test/rails-2/dummy/script/console",
     "test/rails-2/dummy/script/dbconsole",
     "test/rails-2/dummy/script/destroy",
     "test/rails-2/dummy/script/generate",
     "test/rails-2/dummy/script/performance/benchmarker",
     "test/rails-2/dummy/script/performance/profiler",
     "test/rails-2/dummy/script/plugin",
     "test/rails-2/dummy/script/runner",
     "test/rails-2/dummy/script/server",
     "test/rails-2/test_helper.rb",
     "test/rails-3/dummy/Gemfile",
     "test/rails-3/dummy/Gemfile.lock",
     "test/rails-3/dummy/Rakefile",
     "test/rails-3/dummy/app/controllers/application_controller.rb",
     "test/rails-3/dummy/app/helpers/application_helper.rb",
     "test/rails-3/dummy/app/views/layouts/application.html.erb",
     "test/rails-3/dummy/config.ru",
     "test/rails-3/dummy/config/application.rb",
     "test/rails-3/dummy/config/boot.rb",
     "test/rails-3/dummy/config/database.yml",
     "test/rails-3/dummy/config/environment.rb",
     "test/rails-3/dummy/config/environments/development.rb",
     "test/rails-3/dummy/config/environments/production.rb",
     "test/rails-3/dummy/config/environments/test.rb",
     "test/rails-3/dummy/config/initializers/backtrace_silencers.rb",
     "test/rails-3/dummy/config/initializers/inflections.rb",
     "test/rails-3/dummy/config/initializers/mime_types.rb",
     "test/rails-3/dummy/config/initializers/secret_token.rb",
     "test/rails-3/dummy/config/initializers/session_store.rb",
     "test/rails-3/dummy/config/locales/en.yml",
     "test/rails-3/dummy/config/routes.rb",
     "test/rails-3/dummy/db/test.sqlite3",
     "test/rails-3/dummy/log/development.log",
     "test/rails-3/dummy/log/production.log",
     "test/rails-3/dummy/log/server.log",
     "test/rails-3/dummy/log/test.log",
     "test/rails-3/dummy/public/404.html",
     "test/rails-3/dummy/public/422.html",
     "test/rails-3/dummy/public/500.html",
     "test/rails-3/dummy/public/favicon.ico",
     "test/rails-3/dummy/public/javascripts/application.js",
     "test/rails-3/dummy/public/javascripts/controls.js",
     "test/rails-3/dummy/public/javascripts/dragdrop.js",
     "test/rails-3/dummy/public/javascripts/effects.js",
     "test/rails-3/dummy/public/javascripts/prototype.js",
     "test/rails-3/dummy/public/javascripts/rails.js",
     "test/rails-3/dummy/public/stylesheets/.gitkeep",
     "test/rails-3/dummy/script/rails",
     "test/rails-3/test_helper.rb",
     "test/tests/core/array/merging_test.rb",
     "test/tests/core/enriched_string_test.rb",
     "test/tests/core/string/inflections_test.rb",
     "test/tests/core/string/merging_test.rb",
     "test/tests/locales/nl/internationalization_test.rb",
     "uninstall.rb"
  ]
  s.homepage = %q{http://codehero.es/rails_gems_plugins/rich_i18n}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Enrichments (e9s) module for internationalization (i18n)}
  s.test_files = [
    "test/rails-2/dummy/app/controllers/application_controller.rb",
     "test/rails-2/dummy/app/helpers/application_helper.rb",
     "test/rails-2/dummy/config/boot.rb",
     "test/rails-2/dummy/config/environment.rb",
     "test/rails-2/dummy/config/environments/development.rb",
     "test/rails-2/dummy/config/environments/production.rb",
     "test/rails-2/dummy/config/environments/test.rb",
     "test/rails-2/dummy/config/initializers/backtrace_silencers.rb",
     "test/rails-2/dummy/config/initializers/cookie_verification_secret.rb",
     "test/rails-2/dummy/config/initializers/inflections.rb",
     "test/rails-2/dummy/config/initializers/mime_types.rb",
     "test/rails-2/dummy/config/initializers/new_rails_defaults.rb",
     "test/rails-2/dummy/config/initializers/session_store.rb",
     "test/rails-2/dummy/config/preinitializer.rb",
     "test/rails-2/dummy/config/routes.rb",
     "test/rails-2/dummy/db/seeds.rb",
     "test/rails-2/test_helper.rb",
     "test/rails-3/dummy/app/controllers/application_controller.rb",
     "test/rails-3/dummy/app/helpers/application_helper.rb",
     "test/rails-3/dummy/config/application.rb",
     "test/rails-3/dummy/config/boot.rb",
     "test/rails-3/dummy/config/environment.rb",
     "test/rails-3/dummy/config/environments/development.rb",
     "test/rails-3/dummy/config/environments/production.rb",
     "test/rails-3/dummy/config/environments/test.rb",
     "test/rails-3/dummy/config/initializers/backtrace_silencers.rb",
     "test/rails-3/dummy/config/initializers/inflections.rb",
     "test/rails-3/dummy/config/initializers/mime_types.rb",
     "test/rails-3/dummy/config/initializers/secret_token.rb",
     "test/rails-3/dummy/config/initializers/session_store.rb",
     "test/rails-3/dummy/config/routes.rb",
     "test/rails-3/test_helper.rb",
     "test/tests/core/array/merging_test.rb",
     "test/tests/core/enriched_string_test.rb",
     "test/tests/core/string/inflections_test.rb",
     "test/tests/core/string/merging_test.rb",
     "test/tests/locales/nl/internationalization_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<authlogic>, [">= 2.1.2"])
      s.add_runtime_dependency(%q<formtastic>, [">= 1.1.0"])
      s.add_runtime_dependency(%q<hpricot>, [">= 0"])
      s.add_runtime_dependency(%q<i18n>, [">= 0.3.7"])
      s.add_runtime_dependency(%q<jzip>, [">= 1.0.11"])
    else
      s.add_dependency(%q<authlogic>, [">= 2.1.2"])
      s.add_dependency(%q<formtastic>, [">= 1.1.0"])
      s.add_dependency(%q<hpricot>, [">= 0"])
      s.add_dependency(%q<i18n>, [">= 0.3.7"])
      s.add_dependency(%q<jzip>, [">= 1.0.11"])
    end
  else
    s.add_dependency(%q<authlogic>, [">= 2.1.2"])
    s.add_dependency(%q<formtastic>, [">= 1.1.0"])
    s.add_dependency(%q<hpricot>, [">= 0"])
    s.add_dependency(%q<i18n>, [">= 0.3.7"])
    s.add_dependency(%q<jzip>, [">= 1.0.11"])
  end
end

