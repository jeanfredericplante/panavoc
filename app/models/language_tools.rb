require 'rubygems'
gem 'httparty'
require 'httparty'
require 'uri'

class LanguageTools
  include HTTParty


  def self.definition_google(text)
    key = APP_CONFIG["api_google"]
    url = 'http://www.google.com/dictionary/json?callback=dict_api.callbacks.id100&q='+text+'&sl=en&tl=en&restrict=pr%2Cde&client=te'
    puts url
    response = HTTParty.get(url)
    puts response
  end

  def self.definition_dictionary_com(text)
    key = APP_CONFIG["api_dictionary_com"]
    text_uri = URI.escape(text, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    url = "http://api-pub.dictionary.com/v001?vid="+key+"&q="+text_uri+"&type=define"
    puts url
    response = HTTParty.get(url)
    if !response["dictionary"]["entry"].nil?
     # return response["dictionary"]
      #return display_voc_formatted_from_dictionary_com(response["dictionary"])
      return response["dictionary"]
    else
      return nil
    end
  end


  
  def self.definition_abbr(text)
    key = APP_CONFIG["api_abbr_com"]
    text_uri = URI.escape(text, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    base_uri = "http://www.abbreviations.com/services/v1/defs.aspx?tokenid=+"+key+"&word=" 
    url = base_uri+ text_uri
    puts url
    response = HTTParty.get(url)
    if !response["results"].nil?
      # return display_voc_formatted_from_abbr(response["results"]["result"])
      return response["results"]["result"].to_yaml
    else
      return nil
    end
  end

  def self.translate(text,from_locale="en",to_locale="fr")
    key = APP_CONFIG["api_translate_com"]
    text_uri = URI.escape(text, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    base_uri = "https://www.googleapis.com/language/translate/v2?key="+key
    url = base_uri+"&q="+text_uri+"&source="+from_locale+"&target="+to_locale
    puts url
    response = HTTParty.get(url)
    puts response["data"]["translations"].size()
    return response["data"]["translations"][0]["translatedText"]
  end

   def self.display_voc_formatted_from_abbr(response)
    begin
      def_list = ""
      response.each do |word|
        if (word["partofspeech"] && word["definition"])
          def_list =def_list + "<li>"+ word["partofspeech"] + ": "+ word["definition"] + "</li>"
        end
      end
    rescue
      def_list  = "NA"
    end
  return def_list.html_safe 
  end


   def self.display_voc_formatted_from_dictionary_com(response)
    begin
      def_list = "<ul>"
      entry_array = normalize_to_array(response["entry"])
      entry_array.each do |entry|
        def_list = "<li>" + def_list
        if !entry["partofspeech"].nil?
          partofspeech_array = normalize_to_array(entry["partofspeech"])
          partofspeech_array.each do |partofspeech|
              if (partofspeech["pos"] && partofspeech["defset"]["def"])
                  def_list = def_list +partofspeech["pos"] + ": "
                  definition_array = normalize_to_array(partofspeech["defset"]["def"])
                  definition_array.each do |definition|
                    def_list += definition + ";"  
                  end
                  def_list = def_list + "</ul>"
              end
          end
        end
        def_list = def_list + "</li>"
      end
     def_list = def_list + "</ul>"
    end
  return def_list.html_safe 
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
  

  def self.normalize_to_array(x)
      if x.kind_of?(Array)
          y = x
      else
          y = Array.new
          y << x
      end
      return y
  end
  

end

