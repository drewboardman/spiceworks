require "spec_helper"

module CountDescendents
  describe "Interface" do
    context "#solicit_url" do
      it "displays the correct message" do
        interface = Interface.new
        expect(interface.solicit_url).to eq("Please enter the full URL of the site you would like to investigate.")  
      end
    end
  end
end