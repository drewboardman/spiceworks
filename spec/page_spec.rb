require "spec_helper"

module CountDescendents
  describe "Page" do

    context "#initialize" do
      it "accepts no params and doesn't break" do
        page = Page.new
        expect(page.url).to eq('')  
      end

      it "creates a page object" do
        page = Page.new(url: "http://www.bestbuy.com")
        expect(page.class).to eq(CountDescendents::Page)
      end

      it "creates a node_string attr when given input" do
        page = Page.new(node_string: '<ul class="utility-nav">')
        expect(page.node_string.to_s).to eq('<ul class="utility-nav">')
      end
    end

    context "#parse_html" do
      it "creates an object of class Nokogiri::HTML::Document when given a url" do
        page = Page.new(url: "http://www.bestbuy.com")
        expect(page.doc.class).to eq(Nokogiri::HTML::Document)
      end
    end

    context "#grab_node" do
    	it "correctly returns an object of class Nokogiri::XML::Element" do
    		page = Page.new(url: "http://www.bestbuy.com", node_string: '<ul class="utility-nav">')
    		expect(page.matching_node.class).to eq(Nokogiri::XML::Element)
    	end
    end
  end
end