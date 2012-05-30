require 'spec_helper'

describe "the home view", :type => :request do
  let(:word){ Fabricate(:vocentry) }
  
  context "when accessing the home page" do
    before(:all) do
      word
    end
    
    before(:each) do
      visit home_index_path
    end
  
    it "should contain a table row" do
        # page.should have_content(word.eng_word)
        page.should have_selector('table tr')       
    end
    
    it "should list the word name" do 
      page.should have_content(word.eng_word)  
    end
  end

end
