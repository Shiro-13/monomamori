class Equipment < ApplicationRecord
belongs_to :category
belongs_to :rental
attachment :image
validates :name, :place, :status, :caption, presence: true

end
