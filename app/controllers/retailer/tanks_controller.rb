class Retailer::TanksController < Retailer::ApplicationController
    before_action :set_station
    before_action :set_tank, only: [:show, :edit, :update, :destroy]

    def set_station
        @station = Station.find(params[:station_id])
    end

    def index
        @tanks = @station.tanks
    end

    def show
    end

    def new
        @tank = @station.tanks.build
    end

    def edit
    end

    def create
        @tank = @station.tanks.create(tank_params)
        redirect_to retailer_station_path(@station)
    end

    def update
        if @tank.update(tank_params)
            redirect_to retailer_station_tank_path(@station, @tank)
        else
            render 'edit'
        end
    end

    def destroy
        @tank.destroy
        redirect_to retailer_station_tanks_path(@station), notice: 'Tank was successfully destroyed.'
    end

    private

    def set_tank
        @tank = @station.tanks.find(params[:id])
    end

    def tank_params
        params.require(:tank).permit(:type_of_fuel, :size, :registration_id, :station_id)
    end
end
