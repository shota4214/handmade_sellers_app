class TopController < ApplicationController

  def index
    @user_assign_shops = current_user.assign_shops unless current_user.nil?
  end
end
