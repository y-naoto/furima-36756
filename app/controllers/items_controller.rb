class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @item =Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def show
    @item =Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path
    else 
       render :new
    end
  end 

  private
  def item_params
    params.require(:item).permit(:item_name, :item_explanation, :condition_id, :category_id, :send_money_id, :todoufukenn_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

end
