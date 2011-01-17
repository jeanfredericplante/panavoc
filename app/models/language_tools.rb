require 'rubygems'
gem 'httparty'
require 'httparty'
require 'uri'

class LanguageTools
  include HTTParty


  def self.definition_google(text)
    key = "AIzaSyBPAo4X2KBWrjoUYkIpb_SOOvP5HJ-0y_0"
    url = 'http://www.google.com/dictionary/json?callback=dict_api.callbacks.id100&q='+text+'&sl=en&tl=en&restrict=pr%2Cde&client=te'
    puts url
    response = HTTParty.get(url)
    puts response
  end

  
  def self.definition_abbr(text)
    text_uri = URI.escape(text, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    base_uri = "http://www.abbreviations.com/services/v1/defs.aspx?tokenid=tk1400&word=" 
    url = base_uri+ text_uri
    puts url
    response = HTTParty.get(url)
    return response
  end

  def self.translate(text,from_locale="en",to_locale="fr")
    text_uri = URI.escape(text, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    base_uri = "https://www.googleapis.com/language/translate/v2?key=AIzaSyBPAo4X2KBWrjoUYkIpb_SOOvP5HJ-0y_0"
    url = base_uri+"&q="+text_uri+"&source="+from_locale+"&target="+to_locale
    puts url
    response = HTTParty.get(url)
    puts response["data"]["translations"].size()
    return response["data"]["translations"][0]["translatedText"]
  end

end

