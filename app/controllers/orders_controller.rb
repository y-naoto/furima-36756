class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]
  before_action :authenticate_user!,only: [:index, :create]


  def index
    @order = Order.new
    if current_user == @item.user || @item.buy_item != nil
       redirect_to root_path
    end

  end

  def create
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
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 自身のPAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
  def set_order
    @item = Item.find(params[:item_id])
  end
end
