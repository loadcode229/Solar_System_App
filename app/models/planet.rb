class Planet < ApplicationRecord
    belongs_to :user
    has_many :comments, :dependent => :destroy
    has_many :users, through: :comments
    validates :name, :description, presence: true

    scope :alphabetize_planets, -> { order(name: :asc) }

    mount_uploader :image, ImageUploader
end
