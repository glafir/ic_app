class CountriesController < ApplicationController
layout "application1"
  # GET /countries
  # GET /countries.json
  def index
    @countries = Country.search(params[:search]).order(sort_column + " " + sort_direction).paginate :page => params[:page]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @countries }
      format.xml { render :xml => @countries }
      format.js # index.js.erb 
    end
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
    @country = Country.find(params[:id])
    @airports = Airport.where(iso_code: @country.country_iata_code).order(sort_column + " " + sort_direction).paginate :page => params[:page]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @country }
    end
  end

  # GET /countries/new
  # GET /countries/new.json
  def new
    @country = Country.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @country }
    end
  end

  # GET /countries/1/edit
  def edit
    @country = Country.find(params[:id])
  end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(params[:country])

    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: 'Country was successfully created.' }
        format.json { render json: @country, status: :created, location: @country }
      else
        format.html { render action: "new" }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /countries/1
  # PUT /countries/1.json
  def update
    @country = Country.find(params[:id])

    respond_to do |format|
      if @country.update_attributes(params[:country])
        format.html { redirect_to @country, notice: 'Country was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country = Country.find(params[:id])
    @country.destroy

    respond_to do |format|
      format.html { redirect_to countries_url }
      format.json { head :no_content }
    end
  end

private
  def sort_column
    Country.column_names.include?(params[:sort]) ? params[:sort] : "id"
    Airport.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

end
