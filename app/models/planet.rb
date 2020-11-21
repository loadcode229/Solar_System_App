class Planet < ApplicationRecord
    belongs_to :user
    has_many :planet_moons
    has_many :users, through: :planet_moons

    scope :alphabetize_planets, -> { order(name: :asc) }

    mount_uploader :image, ImageUploader
end
