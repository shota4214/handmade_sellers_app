class MaterialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_material, only: %i[show edit update destroy]
  before_action :set_shop, only: %i[new create index edit update]

  def index
    @materials = Material.where(shop: @shop)
    @material_categories = MaterialCategory.where(shop: @shop)
    categories = params[:search][:material_category_id] if params[:search].present?
    @materials = @materials.joins(:material_categories).where(material_categories: { id: categories }) if categories.present?
  end

  def new
    @material = Material.new
    @units = Unit.where(shop: @shop)
    @suppliers = Supplier.where(shop: @shop)
    @material_categories = MaterialCategory.where(shop: @shop)
  end

  def create
    @material = @shop.materials.build(material_params)
    if @material.save
      UnitAssign.create!(material_id: @material.id, unit_id: params[:material][:unit_id])
      SupplierAssign.create!(material_id: @material.id, supplier_id: params[:material][:supplier_id])
      redirect_to top_shop_path(@shop), notice: "材料を登録しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
    @units = Unit.where(shop: @shop)
    @suppliers = Supplier.where(shop: @shop)
    @material_categories = MaterialCategory.where(shop: @shop)
    unless @material.purchase_number == @material.stock
      redirect_to top_shop_path(@shop), notice: "材料を使用しているため編集できません"
    end
  end

  def update
    if @material.update(material_params)
      redirect_to top_shop_path(@shop), notice: "材料を編集しました"
    else
      render :edit
    end
  end

  private

  def set_material
    @material = Material.find(params[:id])
  end

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def material_params
    params.require(:material).permit(:name, :purchase_price, :purchase_number, :per_price, :purchase_date, :image, :image_cache, :stock, :remarks, { material_category_ids: [] }, :unit_ids, :supplier_ids)
  end
end
