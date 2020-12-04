class Item < ApplicationRecord
  belongs_to :category
  has_one :rental
  has_many :post_rentals
  belongs_to :user
  has_many :favorites, dependent: :destroy
  attachment :image
  validates :name, :place, :status, :caption, presence: true

  enum status: {
    貸出可: 0,
    貸出中: 1
  }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
