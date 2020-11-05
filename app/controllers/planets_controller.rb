class PlanetsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @planets = Planet.all
    end

    def new
        @planet = Planet.new
    end

    def create
        @planet = Planet.new(planet_params)
        if @planet.save
            redirect_to planets_path
        else
            render :new
        end
    end 

    def show
        @planet = Planet.find_by(params[:name])
    end

    private

    def planet_params
        params.require(:planet).permit(:name, :type, :description, :length_of_year, :distance_from_sun, :moons)
    end
end
