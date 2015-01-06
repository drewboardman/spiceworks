module CountDescendents
  class Interface
  attr_accessor :url

    def initialize(page=Page.new)
      @page = page
    end

    def solicit_url
      "Please enter the full URL of the site you would like to investigate."
    end

    def solicit_first_child
      "Enter the DOM element of the first child"
    end

    def solicit_next_sibling
      "Enter the DOM element of the next sibling"
    end

    def get_page(url ='', first_child = '', next_sibling = '')
      Page.new("#{url}", "#{first_child}", "#{next_sibling}")
    end

    def prompt
      puts solicit_url
      url = gets chomp
      puts solicit_first_child
      first_child = gets chomp
      puts solicit_next_sibling
      next_sibling = gets chomp
      page = get_page(url, first_child, next_sibling)
    end
  end
end