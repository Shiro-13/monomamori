class RentalsController < ApplicationController

  def index
    @rentals = current_user.rentals.where(is_returned: false)
  end

  # def pre_rental
  #   @rental = Rental.new(rental_params)
  #   @rental.save
  #   redirect_to new_rental_path
  #   @user = current_user
    # @rentals =current_user.rentals.find_by(item_id: params[:item_id])
  # end

  def new
    @item = Item.new
    @user = current_user
    @rental = current_user.rentals.new
  end

  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      flash[:success] = "備品の貸出手続きが完了しました!"
      # 貸出後、備品ステータスを更新する
      @item = Item.find(params[:id]) # 備品の特定
      @item.update(item_params) #備品ステータスの更新
      if @rental.is_returned == "貸出中"
        Item.where(rental_id: @rental.id).update(status: "貸出中") #貸出ステータスが「貸出中」なら、備品ステータスを「貸出中」に更新
      elsif @rental.is_returned == "返却済み"
        Item.where(rental_id: @rental.id).update(status: "貸出可") #注文ステータスが「入金確認」なら、製作ステータスを「製作待ち」に更新
      end
      redirect_to @rental
    else
      render :new
    end
  end

  def pre_return
    @item = Item.new
  end

  def post_return
    # @item = Item.find(params[:id])
    # puts @item.name
    # if @item.item_rental_info.is_returned == true
    #   @rental = @item.rentals.where(user_id: current_user.id).where(is_returned: false).first
    #   @item.item_rental_info.is_returned = false
    #   @rental.return_date = DateTime.now
    #   @rental.is_returned = true
    #   if @rental.save
    #     @iteminfo = @item.item_rental_info
    #     @iteminfo.last_rental_name = current_user.name
    #     @iteminfo.now_rental_id = nil
    #     @iteminfo.now_rental_name = nil
    #     @iteminfo.save
    #     redirect_to rentals_path
    #   else
    #     render :pre_return
    #   end
    # else
    #   redirect_to "/rentals/return", notice: "その備品はすでに返却済みです。"
    # end
  end

  private

    def rental_params
      params.require(:rental).permit(:rental_date, :return_date, :is_returned, :item_id, :user_id)
    end

end

