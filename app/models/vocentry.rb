class Vocentry < ActiveRecord::Base
  validates_presence_of :eng_word

  def <=>(v)
    self[:eng_word] <=> v[:eng_word]
  end
end
