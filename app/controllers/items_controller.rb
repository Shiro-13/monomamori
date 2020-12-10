class ItemsController < ApplicationController
# load_and_authorize_resource
def index
    @items = Item.all.page(params[:page]).per(10)
end


def new
  @item = Item.new
end

def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to item_path(@item)
  else
    render :new
  end
end

def show
  @user = current_user
  @item = Item.find(params[:id])
  @rental = Rental.new
end

def edit
  @item = Item.find(params[:id])
end

def update
  @item = Item.find(params[:id])
  if @item.update(item_params)
    redirect_to item_path(@item)
  else
    render :edit
  end
end

def destroy
  if @item.destroy
    redirect_to items_path
  else
    render :show
  end
end


private
def item_params
  params.require(:item).permit(:name, :caption, :place, :status, :category_id, :image)
end
end
