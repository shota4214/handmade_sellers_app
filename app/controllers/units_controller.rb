class UnitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shop, only: %i[new create]

  def index
    @units = Unit.all
  end

  def new
    @unit = Unit.new
  end

  def create
    @unit = @shop.units.build(unit_params)
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

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
end
