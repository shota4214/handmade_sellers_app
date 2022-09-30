class UnitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shop, only: %i[index new create destroy]

  def index
    @units = Unit.where(shop_id: @shop)
    @unit_assigns = UnitAssign.pluck(:unit_id)
  end

  def new
    @unit = Unit.new
  end

  def create
    @unit = @shop.units.build(unit_params)
    if @unit.save
      redirect_to top_shop_path(@shop), notice: "単位を登録しました"
    else
      render :new
    end
  end

  def destroy
    @unit = Unit.find(params[:id])
    @unit_assigns = UnitAssign.pluck(:unit_id)
    if @unit_assigns.include?(@unit.id)
      redirect_to top_shop_path(@shop), alert: "使用している単位は削除できません"
    else
      @unit.destroy
      redirect_to top_shop_path(@shop), notice: "単位を削除しました"
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
