module CountDescendents
  class Page
    attr_accessor :url, :first_child, :next_sibling

    def initialize(url='', first_child = '', next_sibling = '')
      @url = url
      @first_child = first_child
      @next_sibling = next_sibling
    end

    def self.parse_html
      page = Nokogiri::HTML(open("#{@url}")) 
    end
  end
end