require "rubygems"
require "bundler"

Bundler.require(:default) # Load all the default gems
Bundler.require(Sinatra::Base.environment) # Load all the environment specific gems

require "active_support/deprecation"
require "active_support/all"

$db = [] # a fake database

require "./app/todo_api.rb"