class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shop, only: %i[index new]
  before_action :set_product, only: %i[]

  def index
    @products = Product.where(shop: @shop)
  end

  def new
    @product = Product.new
    @product.productions.build
    @materials = Material.where(shop: @shop)
  end

  def create
  end

  def get_material
    @get_material = Material.find(params[:material_id])
    @get_material.units.each do |unit|
      @unit = unit
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :image, :image_cache, :product_cost_price, :sales_price, :cost_rate, :create_date, :product_stock, :remarks, production_attributes: [:id, :material_id, :product_id, :use_material_number, :use_cost_price, :_destroy, material_attributes: [:stock]])
  end

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
