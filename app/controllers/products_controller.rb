class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shop, only: %i[index new create]
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
    @product = @shop.products.build(product_params)
    use_materials = params[:product][:productions_attributes]
    if @product.save
      use_materials.each do |use_material|
        material_info = use_material[1]
        material = Material.find(material_info.fetch("material_id"))
        number_used = material_info.fetch("use_material_number").to_i
        material_stock = material.stock - number_used
        material.update!(stock: material_stock)
      end
      redirect_to top_shop_path(@shop), notice: "商品を登録しました"
    else
      render :new
    end
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
    params.require(:product).permit(:name, :image, :image_cache, :product_cost_price, :sales_price, :cost_rate, :create_date, :product_stock, :remarks, productions_attributes: [:id, :material_id, :product_id, :use_material_number, :use_cost_price, :_destroy])
  end

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
