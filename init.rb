Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each { |fn|
  require fn

  # E.g. "./lib/active_record/scopes/limit.rb" -> ActiveRecord::Scopes::Limit
  module_name = fn.sub("./lib/", "").sub(".rb", "").camelize.constantize

  ActiveRecord::Base.send :include, module_name
}
