class PlanetMoonsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @planet_moons = PlanetMoon.all
    end

    def new
        @planet_moon = PlanetMoon.new
    end

    def create
        @planet_moon = current_user.planets.planet_moon.build(planet_moon_params)
        if @planet_moon.save
            redirect_to planet_moons_path
        else
            render :new
        end
    end 

    def show
        @planet_moon = PlanetMoon.find_by(id: params[:id])
    end

    def edit
        @planet_moon = PlanetMoon.find_by(id: params[:id])
    end

    def update
        planet_moon = PlanetMoon.find_by(id: params[:id])
        planet_moon.update(planet_moon_params)
        redirect_to planet_moon_path(planet_moon)
    end

    def destroy
        @planet_moon = PlanetMoon.find_by(id: params[:id])
        @planet_moon.destroy
        redirect_to planet_moons_path
    end

    private

    def planet_moon_params
        params.require(:planet_moon).permit(:name, :planet_moon_orbits, :description, :length_of_year, :image, :planet_id)
    end
end
