class OrdersController < ApplicationController
  # include ActiveModel::Model

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    if current_user == @item.user
       redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)

    if @order.valid?
      pay_item

      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:post_code, :todoufukenn_id, :city, :city_address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
