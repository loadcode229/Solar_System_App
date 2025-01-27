class Planet < ApplicationRecord
    belongs_to :user
    has_many :comments, :dependent => :destroy
    has_many :users, through: :comments
    validates :name, :description, presence: true

    scope :alphabetize_planets, -> { order(name: :asc) }

    #scope :search, -> { where("lower(name) LIKE '#{search.downcase}%'")}

    mount_uploader :image, ImageUploader

    def self.search(search)
        where("lower(name) LIKE '#{search.downcase}%'")
    end
end
