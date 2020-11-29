class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :planet

  validates :content, presence: true
end
