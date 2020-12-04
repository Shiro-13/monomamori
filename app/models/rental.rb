class Rental < ApplicationRecord
  belongs_to :item, inverse_of: :rentals
  belongs_to :user, inverse_of: :rentals

  enum is_returned: {
    返却済み: true,
    貸出中: false
  }
end
