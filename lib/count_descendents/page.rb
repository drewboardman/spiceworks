module CountDescendents
  class Page
    attr_accessor :url, :dom, :doc

    def initialize(params = {})
      @url = params.fetch(:url, "")
      @dom = params.fetch(:dom, "")
    end

    def self.parse_html
      @doc = Nokogiri::HTML(open(@url)) 
    end
  end
end