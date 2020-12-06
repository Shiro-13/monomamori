class Item < ApplicationRecord
  belongs_to :category, optional: true
  has_many :rentals
  has_many :post_rentals
  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy
  attachment :image
  validates :name, :place, :status, :caption, presence: true

  enum status: {
    貸出可: 0,
    貸出中: 1
  }

  def self.search(search)
    if search
      Item.where(["name LIKE?","%#{search}%"])
    else
      Item.all
    end
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
