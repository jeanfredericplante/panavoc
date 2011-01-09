class HomeController < ApplicationController
  def index
    @vocentries = Vocentry.select_home_words(:maximum => 5)

   # jQuery.getJSON("http://www.google.com/dictionary/json?callback=dict_api.callbacks.id100&q=test&sl=en&tl=en&restrict=pr%2Cde&client=te",'',get_definition)  

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vocentries }
    end
 
  end
  def get_definition
    alert("hello")
    # @vocentries.each do |v|
    # end
  end


end
