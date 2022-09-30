class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shop, only: %i[index]
  before_action :set_product, only: %i[]

  def index
    @products = Product..where(shop: @shop)
  end

  def new
    @product = Product.new
  end

  def create
  end

  private

  def product_params
    params.require(:product).permit(:name, :image, :image_cache, :product_cost_price, :sales_price, :cost_rate, :create_date, :product_stock, :remarks)
  end

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
