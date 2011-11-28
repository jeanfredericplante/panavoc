class Vocentry < ActiveRecord::Base
  validates_presence_of :eng_word
  validates_uniqueness_of :eng_word
  attr_accessible :eng_word, :eng_desc, :fr_word, :fr_desc, :sp_word, :sp_desc, :frequency, :notes 

  DEFAULT_WORDS_DISPLAYED = 5 # +1

  def <=> (v)
    self[:eng_word] <=> v[:eng_word]
  end

  def format_eng_def
    if self.eng_desc.nil?
      return ""
    else
      return self.eng_desc.each(&method(:hash_to_html)).html_safe
    end
  end
  

  def self.search (search, page, order)
       paginate :per_page => 20, :page => page, :conditions => ["eng_word LIKE ?", "%#{search}%"], :order => order
  end

  def self.select_home_words(opts={})
     {:maximum => 10}.merge!(opts)
     find(:all).sort_by{rand}[0..DEFAULT_WORDS_DISPLAYED]
  end
  
  def to_s
    self.eng_desc.to_yaml
  end
  
  def hash_to_html key,value
     if value.nil?
       puts "<li>#{key}</li>"
     elsif value.is_a?(Hash)
       puts "<li>#{key}"
       puts "<ul>"
       value.each(&method(:hash_to_html))
       puts "</ul></li>"
     else
       fail "I don't know what to do with a #{value.class}"
     end
  end
  
  
end
