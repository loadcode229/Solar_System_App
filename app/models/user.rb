class User < ApplicationRecord
    has_secure_password

    has_many :planets
    has_many :moons
    has_many :comments
    has_many :commented_planets, through: :comments, source: :planet
    has_many :categories, through: :planets

    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    
end

