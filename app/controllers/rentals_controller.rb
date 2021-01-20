class RentalsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = current_user
    @rentals = current_user.rentals.where(is_returned: true).reverse_order
    @returns = current_user.rentals.where(is_returned: false).reverse_order.limit(10)
  end

  def pre_rental
    @user = current_user
    rental_id = params[:rental_id]
    @rental = Rental.find(rental_id)
    @rental.rental_date = Date.today
    @rental.return_date = Date.today
  end

  def create
    @rental = current_user.rentals.new(rental_params)
    @item =Item.find(params[:rental][:item_id])
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
      @rental.update(is_returned: "貸出中")
      Item.find(@rental.item_id).update(status: "貸出中")
      flash[:success] = "備品の貸出手続きが完了しました!"
      redirect_to rentals_path
    else
      render :pre_rental
    end
  end

  def return
    @rental = Rental.find(params[:id])
    @rental.days = Date.today
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

  def destroy
    @rental = Rental.find(params[:id]).destroy
    flash[:success] = "貸出情報を削除しました。"
    redirect_to rentals_path
  end

  private
    def rental_params
      params.require(:rental).permit(:rental_date, :return_date, :is_returned, :user_id, :item_id, :days)
    end

end

