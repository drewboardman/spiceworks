require "pry"
require "nokogiri"
require "open-uri"
module CountDescendents
  class Page
    attr_accessor :url, :html_input, :matching_node, :doc, :node_string

    def initialize(params = {})
      @url = params.fetch(:url, "").to_s
      @html_input = params.fetch(:html_input, "").to_s
      @doc = parse_html(@url)
      @node_string = node_string_convert(@html_input)
      @matching_node = grab_node(@node_string)
    end

    def parse_html(url)
      begin
        Nokogiri::HTML(open(url))
      rescue StandardError=>e
        $stdout.puts "Error: #{e}. This often occurs if the URL given is not correct. Check that you used the exact address (including https, etc)"
      end
    end

    def node_string_convert(html_string)
      node = Nokogiri::XML::DocumentFragment.parse(html_string).child
      return node.to_s
    end

    def grab_node(node_string)
      matches = []
      @doc.traverse do |node|
        matches << node if node.to_html.gsub(/\W+/, '').include?(node_string.gsub(/\W+/, ''))
      end
      return matches.first
    end

    def descendent_count
      count = 0
      @matching_node.traverse do |node|
        count += 1
      end
      return count
    end

  end
end

page = CountDescendents::Page.new(url: "http://stackoverflow.com/", html_input: '<div class="topbar-dialog siteSwitcher-dialog dno">')
p page.descendent_count