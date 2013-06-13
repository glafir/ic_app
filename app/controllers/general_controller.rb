# -*- encoding : utf-8 -*-
class GeneralController < ApplicationController
before_filter :authenticate_user!
layout "general"
  def login
  end
  
  def home
  
      @usermenu = {}
	  @usermenu["1"] = "Профиль."
  end
  def rw
      @usermenu = {}
      @usermenu["1"] = "Поезда дальнего следования."
	  @usermenu["2"] = "Пригородные электропоезда."
	  @usermenu["3"] = "Высокоскоростные аэроэкспрессы."
  end
  
  def air
      @usermenu = {}
      @usermenu["/countries?search=&utf8=✓"] = "Аэропорты мира."
      @usermenu["/airports"] = "Аэропорты ЕШ."
      @usermenu["/aircompanies"] = "Авиакомпании ЕШ."
      @usermenu["/search/airlines"] = "Поиск авиарейсов."
      @usermenu["/timetableaps"] = "Распмсание аэропортов."
  end

  def help
      @usermenu = {}
      @usermenu["1"] = "Справка 1"
	  @usermenu["2"] = "Справка 2"
	  @usermenu["3"] = "Справка 3"
	  @usermenu["4"] = "Справка 4"
  end
end
