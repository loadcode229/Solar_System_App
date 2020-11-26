class Planet < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :comments
    has_many :users, through: :comments
    validates :name, :description, presence: true

    scope :alphabetize_planets, -> { order(name: :asc) }

    def category_attr=(attr)
        self.category = Category.find_or_create_by(attr) if !attr[:name].blank?
    end

    mount_uploader :image, ImageUploader
end
