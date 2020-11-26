class Planet < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :comments, :dependent => :destroy
    has_many :users, through: :comments
    validates :name, :description, presence: true

    scope :alphabetize_planets, -> { order(name: :asc) }

    mount_uploader :image, ImageUploader

    def self.filter(params)
        where("category_id = ?", params)
    end

    def category_attributes=(attr)
        self.category = Category.find_or_create_by(attr) if !attr[:name].blank?
    end
end
