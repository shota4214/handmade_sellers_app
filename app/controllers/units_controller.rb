class UnitsController < ApplicationController
  before_action :authenticate_user!

  def index
    @units = Unit.all
  end

  def new
    @material = Material.find(params[:material_id])
    @unit = Unit.new
  end

  def create
    @material = Material.find(params[:material_id])
    @unit = @material.units.build(unit_params)
    if @unit.save
      redirect_to top_shop_path(@material.shop_id), notice: "単位を登録しました"
    else
      render :new
    end
  end

  private

  def unit_params
    params.require(:unit).permit(:name)
  end
end
