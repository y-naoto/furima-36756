require 'rails_helper'
RSpec.describe Item, type: :model do
   before do
    @item = FactoryBot.build(:item)
   end

  describe '商品出品機能' do
      
    it 'item_nameがない場合は登録できないこと' do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors[:item_name]).to include("can't be blank")
    end
  end
  it "item_explanationがない場合は登録できないこと" do
    @item.item_explanation = nil
    @item.valid?
    expect(@item.errors[:item_explanation]).to include("can't be blank")
  end

  #3
  it "category_idがない場合は登録できないこと" do
    @item.category_id = nil
    @item.valid?
    expect(@item.errors[:category_id]).to include("can't be blank")
  end

  #4
  it "send_money_idがない場合は登録できないこと" do
    @item.send_money_id = nil
    @item.valid?
    expect(@item.errors[:send_money_id]).to include("can't be blank")
  end

  #5
  it "todoufukenn_idがない場合は登録できないこと" do
    @item.todoufukenn_id = nil
    @item.valid?
    expect(@item.errors[:todoufukenn_id]).to include("can't be blank")
  end

  #6
  it "delivery_day_idがない場合は登録できないこと" do
    @item.delivery_day_id = nil
    @item.valid?
    expect(@item.errors[:delivery_day_id]).to include("can't be blank")
  end

  #7
  it "priceがない場合は登録できないこと" do
    @item.price = nil
    @item.valid?
    expect(@item.errors[:price]).to include("price is not a number")
  end

end


    # 全ての条件を入力すると登録ができる
    # 画像がなければ登録できない
    # 商品名がなければ登録できない
    # 価格がなければ登録できない
    # 商品の説明がなければ登録できない
    # カテゴリーがなければ登録できない
    # 商品の状態がなければ登録できない
    # 配送料の負担がなければ登録できない
    # 発送元の地域がなければ登録できない
    # 発送までの日数がなければ登録できない
