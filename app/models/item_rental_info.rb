class ItemRentalInfo < ApplicationRecord
  belongs_to :item, optional: true
end
