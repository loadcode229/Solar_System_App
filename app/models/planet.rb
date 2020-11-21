class Planet < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :users, through: :comments

    scope :alphabetize_planets, -> { order(name: :asc) }

    mount_uploader :image, ImageUploader
end
