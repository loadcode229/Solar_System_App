class PlanetsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @planet = @user.planets.build
        else
            @planet = Planet.new
        end
        @planet.build_category
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @planets = @user.planets.alphabetize_planets
         else
           @error = "That user doesn't exist" if params[:user_id]
           @planets = Planet.alphabetize_planets.includes(:category, :user)
         end
     
         @planets = @planets.search(params[:q].downcase) if params[:q] && !params[:q].empty?
         @planets = @planets.filter(params[:planet][:category_id]) if params[:planet] && params[:planet][:category_id] != ""
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
        @planet = Planet.find_by_id(params[:id])
        redirect_to planets_path if !@planet || @planet.user != current_user
        @planet.build_category if !@planet.category
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
        params.require(:planet).permit(:name, :type_of_planet, :description, :length_of_year, :distance_from_sun, :moons, :image, :category_id, {category_attributes: [:name]})
    end
end
