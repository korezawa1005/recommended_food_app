class Food < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_one_attached :avatar
  validates :name, presence: true
  validates :avatar, content_type: [ "image/png", "image/jpeg", "image/gif" ]
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end
