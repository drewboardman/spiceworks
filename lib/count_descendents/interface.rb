module CountDescendents
  class Interface
  attr_accessor :url

    def initialize(page=Page.new)
      @page = page
    end

    def solicit_url
      "Please enter the full URL of the site you would like to investigate."
    end

    def prompt
      puts solicit_url
      url = gets chomp
      page = Page.new("#{url}")
    end
  end
end