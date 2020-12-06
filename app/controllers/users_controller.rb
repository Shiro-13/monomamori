class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, only: [:edit, :update]

  def index
    @users = Users.all.page(params[:page]).per(10)
  end

  def show
    @user = current_user
    user = params[:user_id]
    @items = @user.items
    @item = Item.find(params[:id])
    favorites = Favorite.where(user_id: current_user.id).pluck(:item_id)  # ログイン中のユーザーのお気に入りのitem_idカラムを取得
    @favorite_list = Item.find(favorites)     # itemsテーブルから、お気に入り登録済みのレコードを取得
    rentals = current_user.rentals.all.reverse_order # revers_rentalでrental情報を古い順に表示。revers_orderを使用するためrentalに代入。
    @rentals = current_user.rentals.all
    rental_id = params[:rental_id]
    @rental = Rental.find_by(rental_id)
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
