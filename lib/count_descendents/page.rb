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
        $stdout.puts "Error: #{e} for #{@url}. This often occurs if the URL given is not correct. Check that you used the exact address (including https, etc)"
      end
    end

    def node_string_convert(html_string)
      node = Nokogiri::XML::DocumentFragment.parse(html_string).child
      return node.to_s
    end

    def grab_node(node_string)
      matches = []
      if @doc.class == Nokogiri::HTML::Document
        @doc.traverse do |node|
          matches << node if node.to_html.gsub(/\W+/, '').include?(node_string.gsub(/\W+/, ''))
        end
        return matches.first
      else
        $stdout.puts "You entered an invalid URL. Nokogiri was not able to use the #traverse method. This usually means
        that an invalid URL was passed, which couldn't be opened."
      end
    end

    def descendent_count
      count = 0
      @matching_node.traverse do |node|
        count += 1
      end
      return count
    end

    def desc_array_tags
      tags = []
      @matching_node.traverse do |desc|
        tags << desc.name
      end
      return tags
    end

  end
end

# page = CountDescendents::Page.new(url: "\"http://www.bestbuy.com, html_input: '<ul class="utility-nav">')
# p page.descendent_count
# p page.desc_array_tags