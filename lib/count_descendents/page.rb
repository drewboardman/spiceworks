module CountDescendents
  class Page
    attr_accessor :url

    def initialize(url='')
      @url = url
    end

    def self.parse_html
      page = Nokogiri::HTML(open("#{@url}")) 
    end
  end
end