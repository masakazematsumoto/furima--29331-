class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = OrderDonation.new
  end

  def create
    @item = Item.find(params[:item_id])
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
    #params.permit(:price, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchaser, :token )
    params.require(:order_donation).permit(:post_code, :city, :address, :building_name, :phone_number, :prefecture_id ).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:card_token])
  end
  
  def pay_item
    @item = Item.find(params[:item_id])
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
end

