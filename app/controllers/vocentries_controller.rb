class VocentriesController < ApplicationController
  # GET /vocentries
  # GET /vocentries.xml


  def index
  sort_init 'eng_desc'
  sort_update
    #@vocentries = Vocentry.all.sort
    @vocentries = Vocentry.search(params[:search], params[:page], sort_clause)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vocentries }
    end
  end

  # GET /vocentries/1
  # GET /vocentries/1.xml
  def show
    @vocentry = Vocentry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vocentry }
    end
  end

  # GET /vocentries/new
  # GET /vocentries/new.xml
  def new
    @vocentry = Vocentry.new
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vocentry }
    end
  end

  # GET /vocentries/1/edit
  def edit
    @vocentry = Vocentry.find(params[:id])
  end

  # POST /vocentries
  # POST /vocentries.xml
  def create
    @vocentry = Vocentry.new(params[:vocentry])

    respond_to do |format|
      if @vocentry.save
        format.html { redirect_to(@vocentry, :notice => 'Your new word was successfully saved.') }
        format.xml  { render :xml => @vocentry, :status => :created, :location => @vocentry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vocentry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vocentries/1
  # PUT /vocentries/1.xml
  def update
    @vocentry = Vocentry.find(params[:id])

    respond_to do |format|
      if @vocentry.update_attributes(params[:vocentry])
        format.html { redirect_to(@vocentry, :notice => 'Vocentry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vocentry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vocentries/1
  # DELETE /vocentries/1.xml
  def destroy
    @vocentry = Vocentry.find(params[:id])
    @vocentry.destroy

    respond_to do |format|
      format.html { redirect_to(vocentries_url) }
      format.xml  { head :ok }
    end
  end
  
  def get_definition
    logger.debug("I have entered get definition")
    @voc_item = Vocentry.find(params[:id])
    @voc_item.eng_desc = LanguageTools.definition_abbr(@voc_item.eng_word.downcase)
    respond_to do |format|
      format.js
    end
  rescue ActiveRecord::RecordNotFound
    logger.error("invalid param")
    redirect_to :controller => 'home', :action => "index"
  end

  end

