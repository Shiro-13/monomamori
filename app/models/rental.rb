class Rental < ApplicationRecord
  belongs_to :item, inverse_of: :rentals
  belongs_to :user, inverse_of: :rentals
end
