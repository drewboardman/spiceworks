require "spec_helper"

module CountDescendents
  describe "Page" do
    context "#initialize" do
      it "create a page with url=''" do
        page = Page.new
        expect(page.url).to eq('')  
      end
    end
  end
end