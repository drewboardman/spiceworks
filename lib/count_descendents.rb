require_relative "count_descendents/version"
require "rubygems"
require "nokogiri"
require "open-uri"
Dir[File.dirname(__FILE__) + '/count_descendents/*.rb'].each {|file| require file }

module CountDescendents
  # interface = Interface.new
  # interface.prompt
end
