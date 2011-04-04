class Vocentry < ActiveRecord::Base
  validates_presence_of :eng_word
  validates_uniqueness_of :eng_word


  def <=> (v)
    self[:eng_word] <=> v[:eng_word]
  end

  def format_eng_def
    if self.eng_desc.nil?
      return ""
    else
      return self.eng_desc.html_safe
    end
  end

  def self.search (search, page, order)
       paginate :per_page => 20, :page => page, :conditions => ["eng_word LIKE ?", "%#{search}%"], :order => order
  end

  def self.select_home_words(opts={})
     {:maximum => 10}.merge!(opts)
     find(:all).sort_by{rand}[0..5]
  end

  
end
