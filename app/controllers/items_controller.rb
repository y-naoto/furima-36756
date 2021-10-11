class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @item = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_explanation, :condition_id, :category_id, :send_money_id, :todoufukenn_id,
                                 :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path if @item.user != current_user || @item.buy_item != nil
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
