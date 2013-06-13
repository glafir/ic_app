# encoding: UTF-8
class TownsController < ApplicationController
# GET /towns
def index
@towns = Town.paginate :page => params[:page], :order => 'pop desc'
  end

  # GET /towns/1
  def show
    @town = Town.find(params[:id])
end

# GET /towns/new
def new
@town = Town.new
end

# GET /towns/1/edit
def edit
@town = Town.find(params[:id])
end

# POST /towns
def create
@town = Town.new(params[:town])

if @town.save
redirect_to({:action => 'index'}, {:notice => 'Town добавлен'})
    else
      render :action, '"new"'
    end
  end

  # PUT /towns/1
  def update
    @town = Town.find(params[:id])

if @town.update_attributes(params[:town])
redirect_to(@town, :notice => 'Изменения внесены')
    else
      render :action, '"edit"'
    end
  end

  # DELETE /towns/1
  def destroy
    @town = Town.find(params[:id])
@town.destroy

redirect_to (towns_url)
  end
end