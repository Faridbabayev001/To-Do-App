class HomeController < ApplicationController
  layout "home"

  def index
    render "home"
  end
end
