
(required_files = %w(object string enriched_string)).each do |file|
  require "rich/i18n/core/#{file}"
end

Dir[File.join(File.dirname(__FILE__), "core", "*.rb")].each do |file|
  require file unless required_files.include?(File.basename file, ".rb")
end
