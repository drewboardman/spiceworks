require "count_descendents/version"
require "rubygems"
require "nokogiri"
require "open-uri"

module CountDescendents
end

Dir[File.dirname(__FILE__) + '/count_descendents/*.rb'].each {|file| require file }
