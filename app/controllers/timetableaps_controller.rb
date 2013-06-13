class TimetableapsController < ApplicationController
  # GET /timetableaps
  # GET /timetableaps.json
  def index
    @timetableaps = Timetableap.select("*,(select city_rus from airports where airports.id = timetableaps.way_end) as city_rus_end,(select city_rus from airports where airports.id = timetableaps.way_start) as city_rus_start").all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @timetableaps }
    end
  end

  # GET /timetableaps/1
  # GET /timetableaps/1.json
  def show
    @timetableap = Timetableap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @timetableap }
    end
  end

  # GET /timetableaps/new
  # GET /timetableaps/new.json
  def new
    @timetableap = Timetableap.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @timetableap }
    end
  end

  # GET /timetableaps/1/edit
  def edit
    @timetableap = Timetableap.find(params[:id])
  end

  # POST /timetableaps
  # POST /timetableaps.json
  def create
    @timetableap = Timetableap.new(params[:timetableap])

    respond_to do |format|
      if @timetableap.save
        format.html { redirect_to @timetableap, notice: 'Timetableap was successfully created.' }
        format.json { render json: @timetableap, status: :created, location: @timetableap }
      else
        format.html { render action: "new" }
        format.json { render json: @timetableap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /timetableaps/1
  # PUT /timetableaps/1.json
  def update
    @timetableap = Timetableap.find(params[:id])

    respond_to do |format|
      if @timetableap.update_attributes(params[:timetableap])
        format.html { redirect_to @timetableap, notice: 'Timetableap was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @timetableap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timetableaps/1
  # DELETE /timetableaps/1.json
  def destroy
    @timetableap = Timetableap.find(params[:id])
    @timetableap.destroy

    respond_to do |format|
      format.html { redirect_to timetableaps_url }
      format.json { head :no_content }
    end
  end
  
  def insert
    
	@timetableaps = Timetableap.all
	@timetableaps.each do |tt|
	  tt << Time.now
	end
  end
end
