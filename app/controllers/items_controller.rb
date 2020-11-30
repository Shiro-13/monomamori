class ItemsController < ApplicationController

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
  @item = Item.find(params[:id])
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
end

private
def item_params
  params.require(:item).permit(:name, :caption, :place, :status, :category_id, :renral_id, :image)
end
end
