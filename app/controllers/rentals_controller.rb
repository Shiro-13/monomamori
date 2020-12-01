class RentalsController < ApplicationController
  def index
    @rentals = current_user.rentals.where(is_returned: false)
  end

  def new
    @item = Item.new
    @rental = Rental.new
  end

  def create
    # user = User.find_by(name: params[:rental][:name])
    @item = Item.find(pramas[:id])
    if @item.is_returned == false
      @rental = current_user.rental.new(rental_date: DateTime.now)
      @rental.item_id = @item.id
      if @rental.save
        @iteminfo = @item.item_rental_info
        @iteminfo.is_returned = true
        @iteminfo.now_rental_id = current_user.id
        @iteminfo.save
        redirect_to rentals_path
      else
        render :new
      end
    else
      redirect_to new_rental_path, notice: "その備品は現在貸出です。"
    end
  end

  def pre_return
    @item = Item.new
  end

  def post_return
    @item = Item.find(params[:id])
    puts @item.name
    if @item.item_rental_info.is_returned == true
      @rental = @item.rentals.where(user_id: current_user.id).where(is_returned: false).first
      @item.item_rental_info.is_returned = false
      @rental.return_date = DateTime.now
      @rental.is_returned = true
      if @rental.save
        @iteminfo = @item.item_rental_info
        @iteminfo.last_rental_name = current_user.name
        @iteminfo.now_rental_id = nil
        @iteminfo.now_rental_name = nil
        @iteminfo.save
        redirect_to rentals_path
      else
        render :pre_return
      end
    else
      redirect_to "/rentals/return", notice: "その備品はすでに返却済みです。"
    end
  end

end

