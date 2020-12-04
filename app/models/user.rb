class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rentals, dependent: :destroy
  has_many :post_rentals
  has_many :items, through: :post_rentals
  has_many :favorites, dependent: :destroy
  has_many :favorite_items, through: :favorites, source: :item # ユーザーがブックマークした備品を直接アソシエーションで取得
 
  enum admin: { 一般ユーザー: false, 管理者: true }

  validates :name, :department, presence: true

end
