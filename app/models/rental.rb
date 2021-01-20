class Rental < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validate :date_return

  def date_return
    return if return_date.blank? || rental_date.blank?
    errors.add(:return_date, "は貸出日以降のものを選択してください") if return_date < rental_date
  end

  enum is_returned: {
    貸出中: true,
    返却済み: false
  }
end
