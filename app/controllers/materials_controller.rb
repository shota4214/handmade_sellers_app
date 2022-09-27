class MaterialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_material, only: %i[show edit update destroy]

  def index
    @materials = Material.all
  end

  def new
    @material = Material.new
  end

  def create
    @material = 
  end

  private

  def set_material
    @material = Material.find(params[:id])
  end

  def material_params
    params.require(:material).permit(:name, :purchase_price, :purchase_number, :per_price, :purchase_date, :image, :image_cache, :stock, :remarks)
  end
end
