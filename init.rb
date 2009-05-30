pwd = File.expand_path(File.dirname(__FILE__))

Dir["#{pwd}/lib/**/*.rb"].each { |fn|
  require fn

  # E.g. "/path/to/app/vendor/plugins/scopes/lib/active_record/scopes/limit.rb"
  # -> ActiveRecord::Scopes::Limit
  module_name = fn.sub("#{pwd}/lib/", "").sub(".rb", "").camelize.constantize

  ActiveRecord::Base.send :include, module_name
}
