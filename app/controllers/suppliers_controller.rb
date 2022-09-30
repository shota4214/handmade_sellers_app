class SuppliersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shop, only: %i[index new create destroy]

  def index
    @suppliers = Supplier.where(shop_id: @shop)
    @supplier_assigns = SupplierAssign.pluck(:supplier_id)
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = @shop.suppliers.build(supplier_params)
    if @supplier.save
      redirect_to top_shop_path(@shop), notice: "仕入れ先を登録しました"
    else
      render :new
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier_assigns = SupplierAssign.pluck(:supplier_id)
    if @supplier_assigns.include?(@supplier.id)
      redirect_to top_shop_path(@shop), alert: "使用している仕入れ先は削除できません"
    else
      @supplier.destroy
      redirect_to top_shop_path(@shop), notice: "仕入れ先を削除しました"
    end
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name)
  end

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
end
