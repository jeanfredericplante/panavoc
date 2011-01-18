class HomeController < ApplicationController
  def index
    @vocentries = Vocentry.select_home_words(:maximum => 5)
    @vocentries.each do |v|
      v.eng_desc = LanguageTools.definition_abbr(v.eng_word.downcase)
    end
    @vocentries.each do |v|
      puts v.eng_desc
    end

   # jQuery.getJSON("http://www.google.com/dictionary/json?callback=dict_api.callbacks.id100&q=test&sl=en&tl=en&restrict=pr%2Cde&client=te",'',get_definition)  
    flash[:notice] = "test";

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vocentries }
      format.js
    end
 
  end
  def get_definition
    flash[:notice] = "test";
    alert("hello")
    # @vocentries.each do |v|
    # end
  end


end
