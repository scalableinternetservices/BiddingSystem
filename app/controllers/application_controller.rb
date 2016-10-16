class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout "home"
  
  def home
      render "home/home"
  end
  
end
