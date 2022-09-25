class AssignsController < ApplicationController

  def create
    shop = find_shop(params[:shop_id])
    user = email_reliable?(assign_params) ? User.find_by(email: assign_params) : nil
    if user
      shop.invite_member(user)
      redirect_to shop_url(shop), notice: "#{shop.name}ショップに登録されました"
    else
      redirect_to shop_url(shop), notice: "ショップ登録に失敗しました"
    end
  end

  def destroy
    assign = Assign.find(params[:id])
    assign.destroy
    redirect_to shop_url
  end

  private

  def assign_params
    params[:email]
  end

  def find_shop(*)
    Shop.find(params[:shop_id])
  end

  def email_reliable?(address)
    address.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end
end
