class Like < ApplicationRecord
  belongs_to :user
  belongs_to :food

  validates :user_id, uniqueness: {
    scope: :food_id,
    message: :duplicated
  }

  validate :forbid_to_owner

  private

  def forbid_to_owner
    return unless user && food
    errors.add(:base, :owner_forbidden) if user_id == food.user_id
  end
end
