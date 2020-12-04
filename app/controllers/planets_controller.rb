class PlanetsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:search]
            @planets = current_user.planets.search(params[:search]).order(name: :asc)
        else
            @planets = current_user.planets.alphabetize_planets
        end
    end

    def new
        @planet = Planet.new
    end

    def create
        @planet = current_user.planets.build(planet_params)
        if @planet.save
            redirect_to planets_path
        else
            render :new
        end
    end 

    def show
        @planet = current_user.planets.find_by_id(params[:id])
    end

    def edit
        @planet = current_user.planets.find_by_id(params[:id])
    end

    def update
        planet = Planet.find_by(id: params[:id])
        planet.update(planet_params)
        redirect_to planet_path(planet)
    end

    def destroy
        @planet = Planet.find_by(id: params[:id])
        @planet.destroy
        redirect_to planets_path
    end

    private

    def planet_params
        params.require(:planet).permit(:name, :type_of_planet, :description, :length_of_year, :distance_from_sun, :moons, :image, :search)
    end
end
