class User < ApplicationRecord
    has_secure_password

    has_many :planets
    has_many :comments
    has_many :commented_planets, through: :comments, source: :planet

    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    
end

