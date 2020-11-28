class Category < ApplicationRecord
  has_many :equipments, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
