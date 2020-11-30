class Item < ApplicationRecord
  belongs_to :category
  has_one :rental
  attachment :image
  validates :name, :place, :status, :caption, presence: true
 
  enum status: {
    貸出可: 0,
    貸出中: 1
  }
end
