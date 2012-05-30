require 'spec_helper'

describe Vocentry do
  let(:word) { Fabricate(:vocentry)}
  describe "A vocabulary word" do
     it "should be valid with an english word" do
        word.should be_valid
      end
    
    it "should be invalid without an english definition" do
      word.eng_word = nil
      word.should_not be_valid
    end  
  end
end
