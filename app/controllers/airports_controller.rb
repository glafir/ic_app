# -*- encoding : utf-8 -*-
class AirportsController < ApplicationController
##before_filter :authenticate_user!, except: [ :new, :sign_in ]
layout "application1", :only => [:index, :city, :search_airlines, :search]
  # GET /airports
  # GET /airports.json
  def index
#        @things = current_user.things    
	@airports = Airport.where(iso_code: 'EZ').order(sort_column + " " + sort_direction).paginate :page => params[:page]
	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @airports }
    end
	# render :layout => "layouts/application"
  end

  # GET /airports/1
  # GET /airports/1.json
  def show
    @airport = Airport.find(params[:id])
    @airlines = Aircompany.where(airport_id: params[:id])
    respond_to do |format|
      format.html 
      format.json { render json: @airport }
    end
  end
  
  def city
    @airports = Airport.where(city_eng: params[:city_eng])
	@airports = @airports.paginate :page => params[:page], :order => 'name_rus'

    respond_to do |format|
      format.html { render "index.html.erb"}
      format.json { render json: @airport }
    end
  end

  # GET /airports/new
  # GET /airports/new.json
  def new
    @airport = Airport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @airport }
    end
  end

  # GET /airports/1/edit
  def edit
    @airport = Airport.find(params[:id])
  end

  # POST /airports
  # POST /airports.json
  def create
    @airport = Airport.new(params[:airport])

    respond_to do |format|
      if @airport.save
        format.html { redirect_to @airport, notice: 'Airport was successfully created.' }
        format.json { render json: @airport, status: :created, location: @airport }
      else
        format.html { render action: "new" }
        format.json { render json: @airport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /airports/1
  # PUT /airports/1.json
  def update
    @airport = Airport.find(params[:id])

    respond_to do |format|
      if @airport.update_attributes(params[:airport])
        format.html { redirect_to @airport, notice: 'Airport was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @airport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /airports/1
  # DELETE /airports/1.json
  def destroy
    @airport = Airport.find(params[:id])
    @airport.destroy

    respond_to do |format|
      format.html { redirect_to airports_url }
      format.json { head :no_content }
    end
  end
  
  def tablo_out
#    @airport = Airport.find(params[:id])
#    @curtime = Time.current.utc
#    @timetableaps = TimetablesapFlight.select("*,(select city_rus from airports where airports.id = timetablesap_flights.way_end) as rus").where(way_start: params[:id]).where("start >= :start_m and start <= :end_m",{ :start_m => Time.current.utc-1.hour, :end_m => Time.current.utc+6.hour}).paginate :page => params[:page]
    @wday = Date.today.strftime'%w'.to_s
	@airport = Airport.find(params[:id])
	@timetableaps = Timetableap.select("*,(select city_rus from airports where airports.id = timetableaps.way_end) as rus").where(way_start: params[:id]).where("s#{@wday} = 1")
	@timetableaps = @timetableaps.paginate :page => params[:page], :order => 'TimeStart'
	respond_to do |format|
      format.html
      format.json { render json: @airport }
    end
  end
  
  def tablo_in
    @wday = Date.today.strftime'%w'.to_s
    @airport = Airport.find(params[:id])
	@timetableaps = Timetableap.select("*,(select city_rus from airports where airports.id = timetableaps.way_start) as rus").where(way_end: params[:id]).where("e#{@wday} = 1")
	@timetableaps = @timetableaps.paginate :page => params[:page], :order => 'TimeEnd'
	respond_to do |format|
      format.html
      format.json { render json: @airport }
    end
  end
  
  def search_airlines
    @airport = Airport.where(iso_code: 'EZ')
    # @airport = Airport.new
  	respond_to do |format|
      format.html { render 'search_airlines.html.erb'}
      format.json { render json: @airport }
    end
  end
  
  def search
    @airport = Airport.where(iso_code: 'EZ')
  	respond_to do |format|
      format.html { render 'search.html.erb'}
      format.json { render json: @airport }
    end
  end  
  
private
  def sort_column
    Airport.column_names.include?(params[:sort]) ? params[:sort] : "city_rus"
  end
  
end
