class Admin::TruckingsController < Admin::ApplicationController
  def index
    @truckings = User.all.where(role: 3)
  end
end
