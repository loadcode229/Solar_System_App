class User < ApplicationRecord
    has_secure_password

    has_many :planets
    has_many :planet_moons
    has_many :planet_moons, through: :planet_moons, source: :planet
    
end

