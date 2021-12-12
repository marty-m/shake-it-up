require "httparty"
class HomeController < ApplicationController
  def index
    if params[:error].to_s == "404"
      @errorMsg = "Cocktail not found!"
    else
      @errorMsg = ""
    end
  end

  def search

  end
  end
