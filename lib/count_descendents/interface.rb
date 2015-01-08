module CountDescendents
  class Interface
  attr_accessor :url, :html_input, :page, :io

    def initialize(params = {})
      @url = params.fetch(:url, '')
      @html_input = params.fetch(:html_input, '')
      @io = $stdout
    end

    def prompt
      @io.puts solicit_url if @url.empty?
      @url = $stdin.gets.chomp.to_s
      $stdout.puts @url
      @io.puts solicit_html_input if @html_input.empty?
      @html_input = $stdin.gets.chomp.to_s
      $stdout.puts @html_input
      get_page
      puts @page.descendent_count
    end

    def solicit_url
      "Please enter the full URL of the site you would like to investigate."
    end

    def solicit_html_input
      "Enter the node you would like the descendents of."
    end

    def get_page
      @page = Page.new(url: @url, html_input: @html_input)
    end

  end
end