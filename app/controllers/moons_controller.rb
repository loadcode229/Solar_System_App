class MoonsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @moons = current_user.moons.alphabetize_moons
    end

    def new
        @moon = Moon.new
    end

    def create
        @moon = current_user.moons.build(moon_params)
        if @moon.save
            redirect_to moons_path
        else
            render :new
        end
    end

    def show
        @moon = current_user.moons.find_by_id(params[:id])
    end

    def edit
        @moon = Moon.find_by_id(params[:id])
    end

    def update
        moon = Moon.find_by(id: params[:id])
        moon.update(moon_params)
        redirect_to moon_path(moon)
    end

    def destroy
        @moon = Moon.find_by(id: params[:id])
        @moon.destroy
        redirect_to moons_path
    end

    private

    def moon_params
        params.require(:moon).permit(:name, :planet_moon_orbits, :description, :length_of_year, :image)
    end
end
