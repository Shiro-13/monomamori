class ItemsController < ApplicationController
# load_and_authorize_resource
def index
    @items = Item.all.page(params[:page]).per(12)
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

def category_items
  @category = Category.find(params[:id])
  @items = @category.items.all
  @items = @items.page(params[:page])
  @user = current_user
end

def destroy
  item = Item.find(params[:id])
  if item.status == '貸出可'
    item.destroy
    redirect_to items_path
  else
    flash[:notice] = "その備品は貸出中のため削除できません。"
    redirect_back(fallback_location: root_path)
  end
end

private
def item_params
  params.require(:item).permit(:name, :caption, :place, :status, :category_id, :image)
end
end
