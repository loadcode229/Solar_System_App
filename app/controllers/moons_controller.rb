class MoonsController < ApplicationController

    def index

    end

    def new

    end

    def create

    end

    def show

    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def moon_params
        params.require(:moon).permit(:name, :planet_moon_orbits, :description, :length_of_year, :image)
    end
end
