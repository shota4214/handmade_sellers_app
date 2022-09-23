class TopController < ApplicationController

  def index
    @user_assign_shops = current_user.assign_shops
  end
end
