module CountDescendents
  class Interface
  attr_accessor :url, :dom, :page

    def initialize(params = {})
      @url = params.fetch(:url, '')
      @dom = params.fetch(:dom, '')
    end

    def prompt
      puts solicit_url if @url.empty?
      @url = STDIN.gets.chomp.to_s
      puts solicit_dom if @dom.empty?
      @dom = STDIN.gets.chomp.to_s
      @page = get_page
    end

    def solicit_url
      "Please enter the full URL of the site you would like to investigate."
    end

    def solicit_dom
      "Enter the DOM element you would like the descendents of."
    end

    def get_page
      Page.new(url: @url, dom: @dom)
    end

  end
end