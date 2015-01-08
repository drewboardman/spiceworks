require "spec_helper"

module CountDescendents
  describe "Page" do

    context "#initialize" do

      it "creates a page object" do
        page = Page.new(url: "http://www.bestbuy.com")
        expect(page.class).to eq(CountDescendents::Page)
      end

      it "creates a html_input attr when given input" do
        page = Page.new(url: "http://www.bestbuy.com", html_input: '<ul class="utility-nav">')
        expect(page.html_input.to_s).to eq('<ul class="utility-nav">')
      end
    end

    context "#parse_html" do
      it "creates an object of class Nokogiri::HTML::Document when given a url" do
        page = Page.new(url: "http://www.bestbuy.com")
        expect(page.doc.class).to eq(Nokogiri::HTML::Document)
      end

      it "displays an error if given invalid URL" do
      	page = Page.new(url: "google", html_input: '<ul class="utility-nav">')
      	expect { page.parse_html(page.url) }.to output("error").to_stdout
      end
    end

    context "#grab_node" do
    	it "correctly returns an object of class Nokogiri::XML::Element" do
    		page = Page.new(url: "http://www.bestbuy.com", html_input: '<ul class="utility-nav">')
    		expect(page.matching_node.class).to eq(Nokogiri::XML::Element)
    	end
    end

    context "#descendent_count" do
    	it "correctly returns the number of descendants" do
    		page = Page.new(url: "http://www.bestbuy.com", html_input: '<ul class="utility-nav">')
    		expect(page.descendent_count).to eq(39)
    	end
    end
  end
end