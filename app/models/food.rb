class Food < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  validates :name, presence: true
  validates :avatar, content_type: [ "image/png", "image/jpeg", "image/gif" ]
end
