class Moon < ApplicationRecord
    belongs_to :user
    validates :name, :description, presence: true

    scope :alphabetize_moons, -> { order(name: :asc) }

    mount_uploader :image, ImageUploader
end
