class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_schedule, :price).merge(user_id: current_user.id)
  end
end
