# -*- encoding : utf-8 -*-
class AircompaniesController < ApplicationController
layout "application1", :only => [:index]
  # GET /aircompanies
  # GET /aircompanies.json
  def index
	@aircompanies = Aircompany.paginate :page => params[:page], :order => 'Airline_name_rus'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @aircompanies }
    end
  end

  # GET /aircompanies/1
  # GET /aircompanies/1.json
  def show
    @aircompany = Aircompany.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @aircompany }
    end
  end
  
  # GET /aircompanies/new
  # GET /aircompanies/new.json
  def new
    @aircompany = Aircompany.new
	@airports = Airport.where(iso_code: 'EZ')

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @aircompany }
    end
  end

  # GET /aircompanies/1/edit
  def edit
    @aircompany = Aircompany.find(params[:id])
	@airports = Airport.where(iso_code: 'EZ')
  end

  # POST /aircompanies
  # POST /aircompanies.json
  def create
    @aircompany = Aircompany.new(params[:aircompany])

    respond_to do |format|
      if @aircompany.save
        format.html { redirect_to @aircompany, notice: 'Aircompany was successfully created.' }
        format.json { render json: @aircompany, status: :created, location: @aircompany }
      else
        format.html { render action: "new" }
        format.json { render json: @aircompany.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /aircompanies/1
  # PUT /aircompanies/1.json
  def update
    @aircompany = Aircompany.find(params[:id])

    respond_to do |format|
      if @aircompany.update_attributes(params[:aircompany])
        format.html { redirect_to @aircompany, notice: 'Aircompany was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @aircompany.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aircompanies/1
  # DELETE /aircompanies/1.json
  def destroy
    @aircompany = Aircompany.find(params[:id])
    @aircompany.destroy

    respond_to do |format|
      format.html { redirect_to aircompanies_url }
      format.json { head :no_content }
    end
  end
end
