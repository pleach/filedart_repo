class DartsController < ApplicationController
  # GET /darts
  # GET /darts.json
  def index
    @darts = Dart.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @darts }
    end
  end

  # GET /darts/1
  # GET /darts/1.json
  def show
    @dart = Dart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dart }
    end
  end
  
  
  
  def upload_start
   @name = params[:name]
   @size = params[:size]
   
   @dart = Dart.new(:name=>@name, :size=>@size, :percentage=>0.0, :url => "www.test.com", :completed => false)
   
   respond_to do |format|
     if @dart.save
       format.html 
       format.json { render json: @dart, status: :created, location: @dart }
     else
       format.html 
       format.json { render json: @dart.errors, status: :unprocessable_entity }
     end
   end
  end


  
  def upload_update
    @token = params[:token]
    @uploaded = params[:uploaded]
    
    @dart = Dart.find_by_token(@token)
    
    if @dart
      @dart.percentage = @uploaded
      respond_to do |format|
         if @dart.save
           format.html 
           format.json { render json: @dart, status: :updated, location: @dart }
         else
           format.html 
           format.json { render json: @dart.errors, status: :unprocessable_entity }
         end
       end
    else
      #DART DOES NOT EXIST
    end
  end
  
  def upload_complete
    @token = params[:token]
    
    @dart = Dart.find_by_token(@token)
  
    if @dart
      @dart.percentage = 100.0
      @dart.completed = true
      respond_to do |format|
         if @dart.save
           format.html 
           format.json { render json: @dart, status: :completed, location: @dart }
         else
           format.html 
           format.json { render json: @dart.errors, status: :unprocessable_entity }
         end
       end
    else
      #DART DOES NOT EXIST
    end
  end
  
  
  
  
  
  

  # GET /darts/new
  # GET /darts/new.json
  def new
    @dart = Dart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dart }
    end
  end

  # GET /darts/1/edit
  def edit
    @dart = Dart.find(params[:id])
  end

  # POST /darts
  # POST /darts.json
  def create
    @dart = Dart.new(params[:dart])

    respond_to do |format|
      if @dart.save
        format.html { redirect_to @dart, notice: 'Dart was successfully created.' }
        format.json { render json: @dart, status: :created, location: @dart }
      else
        format.html { render action: "new" }
        format.json { render json: @dart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /darts/1
  # PUT /darts/1.json
  def update
    @dart = Dart.find(params[:id])

    respond_to do |format|
      if @dart.update_attributes(params[:dart])
        format.html { redirect_to @dart, notice: 'Dart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /darts/1
  # DELETE /darts/1.json
  def destroy
    @dart = Dart.find(params[:id])
    @dart.destroy

    respond_to do |format|
      format.html { redirect_to darts_url }
      format.json { head :no_content }
    end
  end
end
