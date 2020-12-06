class Favorite < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item, optional: true

  # validates_uniqueness_of :item_id, scope: :user_id # バリデーション（ユーザーとitemの組み合わせは一意）
  # 同じ投稿を複数回お気に入り登録させないため。
end
