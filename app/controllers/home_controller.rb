class HomeController < ApplicationController
  layout "static_application"

  def index
    @mainTitle = "Welcome in Petrohub Project."
    @mainDesc = "Fuel - Supply - Marketplace"
  end

  def minor
  end
end
