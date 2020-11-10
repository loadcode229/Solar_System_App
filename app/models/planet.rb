class Planet < ApplicationRecord
    belongs_to :user
    has_many :planet_moons
    has_many :users, through: :planet_moons

    mount_uploader :image, ImageUploader
end
