require "spec_helper"

module CountDescendents
  describe "Interface" do

    context "#solicit_url" do
      it "displays the correct message" do
        interface = Interface.new
        expect(interface.solicit_url).to eq("Please enter the full URL of the site you would like to investigate.")  
      end
    end

    context "#solicit_first_child" do
      it "displays the correct message" do
        interface = Interface.new
        expect(interface.solicit_first_child).to eq("Enter the DOM element of the first child")  
      end
    end

    context "#solicit_next_sibling" do
      it "displays the correct message" do
        interface = Interface.new
        expect(interface.solicit_next_sibling).to eq("Enter the DOM element of the next sibling")  
      end
    end

    context "#get_page" do
      it "returns a page object when given a URL" do
        interface = Interface.new
        url = "http://en.wikipedia.org/"
        expect(interface.get_page(url).class).to eq(Page)
      end
    end

    context "#prompt" do
      it "sets the url variable with the user's input" do
        interface = Interface.new

      end
    end
  end
end