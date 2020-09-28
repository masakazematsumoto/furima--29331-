class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create, :pay_item, ]

  def index
    @order = OrderDonation.new

    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    
    @order = OrderDonation.new(order_params)

    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    
    params.require(:order_donation).permit(:post_code, :city, :address, :building_name, :phone_number, :prefecture_id ).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:card_token])
  end
  
  def pay_item
    
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end


  def item_params
    params.require(:item).permit(:name, :price, :image).merge(user_id: current_user.id)
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

end

