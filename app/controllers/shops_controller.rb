class ShopsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update change_owner top]
  before_action :set_shop, only: %i[show edit update change_owner top]

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.owner = current_user
    if @shop.save
      @shop.invite_member(@shop.owner)
      redirect_to @shop, notice: 'ショップを作成しました'
    else
      flash.now[:error] = 'ショップ作成に失敗しました'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to @shop, notice: "ショップ情報を更新しました"
    else
      flash.now[:error] = "ショップ情報の更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @shop.destroy
    redirect_to shops_path, notice: "ショップを削除しました"
  end

  def change_owner
      @shop.update(owner_id: params[:owner_id])
      @user = User.find(@shop.owner_id)
      redirect_to shop_path, notice: "オーナーを変更しました"
  end

  def top
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :owner_id, :image, :image_cache, :email, :shop_url, :telephone_number, :post_code, :address, :opening_date, :business_start, :content)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
