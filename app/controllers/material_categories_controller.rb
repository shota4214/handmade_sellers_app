class MaterialCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shop, only: %i[index new create destroy]

  def index
    @material_categories = MaterialCategory.where(shop_id: @shop)
    @material_category_assigns = MaterialCategoryAssign.pluck(:material_category_id)
  end

  def new
    @material_category = MaterialCategory.new
  end

  def create
    @material_category = @shop.material_categories.build(material_category_params)
    if @material_category.save
      redirect_to top_shop_path(@shop), notice: "単位を登録しました"
    else
      render :new
    end
  end

  def destroy
    @material_category = MaterialCategory.find(params[:id])
    @material_category_assigns = MaterialCategoryAssign.pluck(:material_category_id)
    if @material_category_assigns.include?(@material_category.id)
      redirect_to top_shop_path(@shop), alert: "使用している単位は削除できません"
    else
      @material_category.destroy
      redirect_to top_shop_path(@shop), notice: "単位を削除しました"
    end
  end

  private

  def material_category_params
    params.require(:material_category).permit(:name)
  end

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
end
