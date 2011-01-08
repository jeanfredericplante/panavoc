class HomeController < ApplicationController
  def index
    @vocentries = Vocentry.select_home_words(:maximum => 5)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vocentries }
    end
 
  end

end
