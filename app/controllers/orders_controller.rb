class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    Item.create(item_params)
    @order = Order.new(price: order_params[:price])
  end

  private

  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def item_params
    params.require(:item).permit(:name, :price, :image).merge(user_id: current_user.id)
  end
end
