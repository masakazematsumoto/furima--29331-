class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :postage_id, :condition_id, :prefecture_id, :handling_time_id, :price, :image).merge(user_id: current_user.id)
  end
end
