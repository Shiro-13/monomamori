class PostRentalsController < ApplicationController

  def index
    @user = current_user
    # @post_rental = current_user.post_rental.find_by(item_id: params[:item_id])
    @post_rental = PostRental.where(user_id: current_user.id)
  end

  def create
    # @post_rental = current_user.post_rental.new(post_rental_params)
    # item = Item.find(params[:post_rental][:item_id])
    # @user = current_user
    @post_rental = PostRental.new(post_rental_params)
    @user = User.find(params[:post_rental][:user_id])
    @item =Item.find(params[:post_rental][:item_id])
    # @post_rental.user_id = current_user.id
    # @current_item = PostRental.find_by(item_id: @post_rental.item_id, user_id: @post_rental.user_id)
    # @post_rental = PostRental.new({user_id:params[:user_id], item_id:params[:item_id]})
    # @post_rental = PostRental.(item_id: @post_rental.item_id, user_id: @post_rental.user_id)
    if @post_rental.save
      redirect_to post_rentals_path
    # else
    #   flash[:cart] = "カートに入れる個数を入力してください"
      # redirect_to post_rentals_path
      # redirect_back(fallback_location: root_path)
      # render :index
    end
  end

  def update
  end

  private
  def post_rental_params
    params.require(:post_rental).permit(:item_id, :user_id)
  end
end
