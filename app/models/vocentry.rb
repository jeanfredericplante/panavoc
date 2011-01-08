class Vocentry < ActiveRecord::Base
  validates_presence_of :eng_word

  def <=> (v)
    self[:eng_word] <=> v[:eng_word]
  end

  def self.select_home_words(opts={})
     {:maximum => 10}.merge!(opts)
     find(:all).sort_by{rand}[0..5]
  end
  
end
