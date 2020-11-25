class Moon < ApplicationRecord
    belongs_to :user

    #scope :alphabetize_moons, -> { order(name: :asc) }

    mount_uploader :image, ImageUploader
end
