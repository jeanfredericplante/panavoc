class HomeController < ApplicationController
  def index
    @vocentries = Vocentry.select_home_words(:maximum => 5)
    logger.debug("I have entered index function")

   # jQuery.getJSON("http://www.google.com/dictionary/json?callback=dict_api.callbacks.id100&q=test&sl=en&tl=en&restrict=pr%2Cde&client=te",'',get_definition)  
    flash[:notice] = "test";

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vocentries }
      format.js
    end
 
  end

  def get_definition
    @vocentries = Vocentry.find(params[:collection])
    @vocentries.each do |voc_item|
      voc_item.eng_desc = LanguageTools.definition_abbr(voc_item.eng_word.downcase)
      voc_item.eng_desc = "definition not found" unless voc_item.eng_desc
    end

    respond_to do |format|
      format.js { render :layout => false }
    end
  rescue ActiveRecord::RecordNotFound
    logger.error("invalid param")
    redirect_to :action => "index"
  end

end
