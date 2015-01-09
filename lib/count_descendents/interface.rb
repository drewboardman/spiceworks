module CountDescendents
  class Interface
  attr_accessor :url, :html_input, :page, :io

    def initialize(params = {})
      @url = params.fetch(:url, '').to_s
      @html_input = params.fetch(:html_input, '')
      @io = $stdout
    end

    def prompt
      @io.puts solicit_url if @url.empty?
      @url = $stdin.gets.chomp
      @io.puts solicit_html_input if @html_input.empty?
      @html_input = $stdin.gets.chomp
      get_page
      puts "There are #{@page.descendent_count} descendents."
      puts "The following is an array of all descendent tags:"
      p @page.desc_array_tags
    end

    def solicit_url
      "Please enter the full URL of the site you would like to investigate (without string quotes)."
    end

    def solicit_html_input
      "Enter the node you would like the descendents of(without string quotes)."
    end

    def get_page
      @page = Page.new(url: @url, html_input: @html_input)
    end

  end
end