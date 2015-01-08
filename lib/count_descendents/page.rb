module CountDescendents
  class Page
    attr_accessor :url, :node_string, :matching_node, :doc, :root

    def initialize(params = {})
      @url = params.fetch(:url, "").to_s
      @node_string = params.fetch(:node_string, "").to_s
      @doc = parse_html(@url)
      # @doc.encoding = 'UTF-8'
      @matching_node = grab_node(@node_string)
    end

    def parse_html(url)
      Nokogiri::HTML(open(url))  
    end

    def grab_node(node_string)
      @doc.encoding = 'UTF-8'
      matches = []
      @doc.traverse do |node|
        matches << node if node.to_html == node_string
      end
      return matches.first
    end

  end
end