class Rental < ApplicationRecord
  belongs_to :item
  belongs_to :user

  enum is_returned: {
    返却済み: true,
    貸出中: false
  }
end
