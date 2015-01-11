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

    context "#node_string_convert" do
      it "returns a string" do
        page = Page.new(url: "google", html_input: '<ul class="utility-nav">')
        expect(page.node_string_convert(page.html_input).class).to eq(String)
      end
    end

    context "#parse_html" do
      it "creates an object of class Nokogiri::HTML::Document when given a url" do
        page = Page.new(url: "http://www.bestbuy.com")
        expect(page.doc.class).to eq(Nokogiri::HTML::Document)
      end

      it "displays an error if given invalid URL" do
      	page = Page.new(url: "google", html_input: '<ul class="utility-nav">')
      	expect { page.parse_html(page.url) }.to output("Error: No such file or directory @ rb_sysopen - google for google. This often occurs if the URL given is not correct. Check that you used the exact address (including https, etc)
").to_stdout
      end

      it "does not display an error with valid input" do
      	page = Page.new(url: "http://www.bestbuy.com", html_input: '<ul class="utility-nav">')
      	expect { page.parse_html(page.url) }.not_to output("Error: No such file or directory @ rb_sysopen - google for google. This often occurs if the URL given is not correct. Check that you used the exact address (including https, etc)
").to_stdout
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

    	it "displays an error if @matching_node is invalid" do
    		page = Page.new(url: "google", html_input: "invalid input")
      	expect { page.descendent_count }.to output("Your node was invalid.\n").to_stdout
    	end
    end

    context '#desc_array_tags' do
    	it "does not accept an invalid @matching_node" do
    		page = Page.new(url: "google", html_input: "invalid input")
    		expect{page.desc_array_tags}.to output("Your node was invalid.\n").to_stdout
    	end

    	it "returns the correct array when given valid input" do
    		page = Page.new(url: "http://ruby.bastardsbook.com/chapters/exception-handling/", html_input: '<ul class="headings">')
    		expect(page.desc_array_tags).to eq(["text", "text", "a", "li", "text",
    																			  "text", "a", "li", "text", "text", 
    																			  "a", "li", "text", "text", "a", "li", 
    																			  "text", "text", "a", "li", "text", "ul"])
    	end
    end
  end
end