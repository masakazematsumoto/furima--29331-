class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:show, :edit, :update]
  
  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new
    end
  end

  
  #def show
    
  #end
  
  #def edit
    
  #end
  
  def update
    
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :postage_id, :condition_id, :prefecture_id, :handling_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end


