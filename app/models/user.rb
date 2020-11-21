class User < ApplicationRecord
    has_secure_password

    has_many :planets
    has_many :planet_moons, through: :planets

    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    
end

