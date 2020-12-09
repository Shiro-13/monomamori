class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rentals, dependent: :destroy
  has_many :items
  has_many :favorites, dependent: :destroy
  has_many :favorite_items, through: :favorites, source: :item # ユーザーがブックマークした備品を直接アソシエーションで取得

  enum role: { admin: 1, menber: 2 }

  validates :name, :department, presence: true

end
