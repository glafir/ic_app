# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
before_filter :authenticate_user!
helper_method :sort_column, :sort_direction
require 'date'
#def store_location
#  session[:return_to] = request.fullpath
#end

  before_filter :force_utf8_params
  def force_utf8_params
  traverse = lambda do |object, block|
        if object.kind_of?(Hash)
          object.each_value { |o| traverse.call(o, block) }
        elsif object.kind_of?(Array)
          object.each { |o| traverse.call(o, block) }
        else
          block.call(object)
        end
        object
  end
  force_encoding = lambda do |o|
        o.force_encoding(Encoding::UTF_8) if o.respond_to?(:force_encoding)
  end
  traverse.call(params, force_encoding)
end

  private 
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
protect_from_forgery
end
