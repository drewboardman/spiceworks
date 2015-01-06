require "spec_helper"

module CountDescendents
  describe "Page" do

    context "#initialize" do
      it "accepts no params and doesn't break" do
        page = Page.new
        expect(page.url).to eq('')  
      end

      it "creates a page object" do
        page = Page.new(url: "https://www.wikipedia.org/")
        expect(page.class).to eq(CountDescendents::Page)
      end
    end

    context "#parse_html" do
      it "correctly uses Nokogiri's #parse method to create a Document object" do
        page = Page.new(url: "https://www.wikipedia.org/")
        page.parse_html
        expect(page.doc.class).to eq(Nokogiri::HTML::Document)
      end
    end
  end
end