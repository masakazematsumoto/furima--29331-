class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderDonation.all( order_params )
    @order.save
  end

  private

  def order_params
    params.permit(:price, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchaser, :token )
    params.require(:order_donation).permit(:post_code, :city, :address, :phone_number, :prefecture_id )
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
