class User < ApplicationRecord
    has_many :planets
    has_many :planet_moons, through: :planets

    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true
    
end

