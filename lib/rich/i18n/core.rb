(required_files = %w(object string enriched_string)).each do |file|
  require "rich/i18n/core/#{file}"
end

Dir[File.expand_path("../core/*.rb", __FILE__)].each do |file|
  require file unless required_files.include?(File.basename file, ".rb")
end