require "spec_helper"

module CountDescendents
  describe "Interface" do

    context "#initialize" do
      it "can set a url attr" do
        url = "http://www.bestbuy.com"
        interface = Interface.new(url: url)
        expect(interface.url).to eq("http://www.bestbuy.com")
      end
    end

    context "#solicit_url" do
      it "displays the correct message" do
        interface = Interface.new
        expect(interface.solicit_url).to eq("Please enter the full URL of the site you would like to investigate (without string quotes).")  
      end
    end

    context "#solicit_html_input" do
      it "displays the correct html_input message" do
        interface = Interface.new
        expect(interface.solicit_html_input).to eq("Enter the node you would like the descendents of(without string quotes).")  
      end
    end

    context "#get_page" do
      it "returns a page object when given a URL" do
        url = "http://www.bestbuy.com"
        interface = Interface.new(url: url)
        expect(interface.get_page.class).to eq(Page)
      end

      it "can pass input parameters to Page and they are accepted" do
        interface = Interface.new(url: "http://www.bestbuy.com", html_input: '<ul class="utility-nav">')
        page = Page.new(url: interface.url, html_input: interface.html_input)
        expect(page.url).to eq(interface.url)
        expect(page.html_input).to eq(interface.html_input)  
      end
    end

    context "#prompt" do
      it "does not solicit_url if given one" do
        url = "http://www.bestbuy.com"
        io = StringIO.new
        interface = Interface.new(url: url, io: io)
        expect(interface.io.to_s).not_to eq("Please enter the full URL of the site you would like to investigate.")
      end
    end
  end
end