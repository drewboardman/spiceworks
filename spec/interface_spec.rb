require "spec_helper"

module CountDescendents
  describe "Interface" do

    context "#initialize" do
      it "can set a url attr" do
        url = "http://en.wikipedia.org/"
        interface = Interface.new(url: url)
        expect(interface.url).to eq("http://en.wikipedia.org/")
      end
    end

    context "#solicit_url" do
      it "displays the correct message" do
        interface = Interface.new
        expect(interface.solicit_url).to eq("Please enter the full URL of the site you would like to investigate.")  
      end
    end

    context "#solicit_dom" do
      it "displays the correct dom message" do
        interface = Interface.new
        expect(interface.solicit_dom).to eq("Enter the DOM element you would like the descendents of.")  
      end
    end

    context "#get_page" do
      it "returns a page object when given a URL" do
        interface = Interface.new
        url = "http://en.wikipedia.org/"
        expect(interface.get_page.class).to eq(Page)
      end
    end

    # context "#prompt" do
    #   it "does not solicit_url if given one" do
    #     url = "http://en.wikipedia.org/" 
    #     interface = Interface.new(url: url)

    #   end
    # end
  end
end