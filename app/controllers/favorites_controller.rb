class FavoritesController < ApplicationController
  # before_action :set_item
  before_action :authenticate_user!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）
  
  # お気に入り登録
  def create
    @item =Item.find(params[:item_id])
    favorite = current_user.favorites.new(item_id: @item.id)
    favorite.save
  end
  
  # お気に入り削除
  def destroy
    @item = Item.find(params[:item_id])
    favorite = current_user.favorites.find_by(item_id: @item.id)
    favorite.destroy
  end
  
  # private
  # def set_item
  #   @item = Item.find(params[:item_id])
  # end
end
