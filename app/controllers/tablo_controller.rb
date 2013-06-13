# -*- encoding : utf-8 -*-
class TabloController < ApplicationController
  def index
    @usermenu = {}
    @usermenu["/air/worldAP"] = "Аэропорты мира."
	@usermenu["/airports"] = "Аэропорты ЕШ."
	@usermenu["/aircompanies"] = "Авиакомпании ЕШ."
	@usermenu["/timetableaps"] = "Распмсание аэропортов."
	  
	@timetableaps = Timetableap.where(way_end :params[:id])
	# respond_to do |format|
      # format.html { render "timetableaps/index.html.erb"}
      # format.json { render json: @timetableaps }
    # end
  end
end
