class ShopsController < ApplicationController

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

  private

  def shop_params
    params.require(:shop).permit(:name, :owner_id, :image, :image_cache, :email, :shop_url, :telephone_number, :post_code, :address, :opening_date, :business_start, :content)
  end
end
