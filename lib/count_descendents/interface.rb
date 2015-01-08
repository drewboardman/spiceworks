module CountDescendents
  class Interface
  attr_accessor :url, :node_string, :page, :io

    def initialize(params = {})
      @url = params.fetch(:url, '')
      @node_string = params.fetch(:node_string, '')
      @io = $stdout
    end

    def prompt
      @io.puts solicit_url if @url.empty?
      @url = STDIN.gets.chomp.to_s
      @io.puts solicit_node_string if @node_string.empty?
      @node_string = STDIN.gets.chomp.to_s
      get_page
      puts @page.root
    end

    def solicit_url
      "Please enter the full URL of the site you would like to investigate."
    end

    def solicit_node_string
      "Enter the node you would like the descendents of."
    end

    def get_page
      @page = Page.new(url: @url, node_string: @node_string)
    end

  end
end