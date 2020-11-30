class EquipmentsController < ApplicationController

def index
  @equipments = Equipments.all
end

def new
  @equipment = Equipment.new
end

def create
  @equipment = Equipment.new(equipment_params)
  if @equipment.save
    redirect_to equipment_path(@equipment)
  else
    render :new
  end
end

def show
  @equipment = Equipment.find(params[:id])
end

def edit
  @equipment = Equipment.find(params[:id])
end

def update
  @equipment = Equipment.find(params[:id])
  if @equipment.update(equipment_params)
    redirect_to equipment_path(@equipment)
  else
    render :edit
  end
end

def destroy
end

private
def equipment_params
  params.require(:equipment).permit(:name, :caption, :place, :status, :category_id, :renral_id, :image)
end

end
