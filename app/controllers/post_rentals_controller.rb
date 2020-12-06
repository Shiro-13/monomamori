class PostRentalsController < ApplicationController

  def index
    @user = current_user
    @post_rental = PostRental.find_by(user_id: current_user.id)
    @rental = Rental.new
  end

  def create
    @user = current_user
    @post_rental = PostRental.new(post_rental_params)
    @item =Item.find(params[:post_rental][:item_id])
    @post_rental.user_id = current_user.id
    if @post_rental.save
      redirect_to post_rentals_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def update
  end

  private
  def post_rental_params
    params.require(:post_rental).permit(:item_id)
  end
end
