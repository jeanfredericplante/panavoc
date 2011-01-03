class Vocentry < ActiveRecord::Base
  validates_presence_of :eng_word
  validates_uniqueness_of :eng_word
end
