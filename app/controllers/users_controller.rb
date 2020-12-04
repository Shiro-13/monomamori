class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def index
    @users = Users.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items
    @item = Item.find(params[:id])
    # @category =
    favorites = Favorite.where(user_id: current_user.id).pluck(:item_id)  # ログイン中のユーザーのお気に入りのitem_idカラムを取得
    @favorite_list = Item.find(favorites)     # itemsテーブルから、お気に入り登録済みのレコードを取得
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :department, :admin, :email)
  end

end
