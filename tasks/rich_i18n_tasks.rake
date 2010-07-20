
namespace :rich_i18n do
  Rake::TestTask.new do |t|
    t.libs << "test"
    t.verbose    = false
    t.test_files = FileList.new("vendor/plugins/rich_i18n/test/**/*.rb") do |list|
                     # list.exclude "foo.rb"
                   end
  end
  Rake::Task["rich_i18n:test"].comment = "Run the rich_i18n plugin tests"
end
