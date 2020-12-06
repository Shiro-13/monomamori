class RentalsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = current_user
    rentals = current_user.rentals.all.reverse_order # revers_rentalでrental情報を古い順に表示。revers_orderを使用するためrentalに代入。
    @rentals = current_user.rentals.all
    # @rental = Rental.find_by(user_id: current_user.id)
    rental_id = params[:rental_id]
    @rental = Rental.find_by(rental_id)
  end

  def pre_rental
    @user = current_user
    rental_id = params[:rental_id]
    @rental = Rental.find(rental_id)
    @rental.rental_date = Date.today.to_s
  end

  def create
    @user = current_user
    @rental = Rental.new(rental_params)
    @item =Item.find(params[:rental][:item_id])
    @rental.user_id = current_user.id
    if @rental.save
      redirect_to rentals_pre_rental_path(rental_id: @rental.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def confirm
    @rental = Rental.find(params[:id])
    @rental.rental_date = params[:rental][:rental_date]
    @rental.return_date = params[:rental][:return_date]
    if @rental.save
      # 貸出後、備品ステータスを更新する
      Item.find(@rental.item_id).update(status: "貸出中")
      # @item = Item.find(params[:rental][:item_id]) # 備品の特定
      # @item.update(status: "貸出中") #備品ステータスの更新
      flash[:success] = "備品の貸出手続きが完了しました!"
      redirect_to rentals_path
    else
      render :new
    end
  end

  def return
    @rental = Rental.find(params[:id])
    @rental.days = Date.today.to_s
    @rental.update(is_returned: "返却済み")
    if @rental.save
      Item.find(@rental.item_id).update(status: "貸出可")
      flash[:success] = "備品を返却しました!"
      redirect_to rentals_path
    else
      flash[:notice] = "その備品はすでに返却済みです。"
      redirect_back(fallback_location: root_path)
    end
  end


  private
    def rental_params
      params.require(:rental).permit(:rental_date, :return_date, :is_returned, :user_id, :item_id, :days)
    end

end

