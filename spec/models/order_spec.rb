require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: @user.id, item_id: @item.id)
      sleep 0.2  
    end

    context '正常系' do
      it '全ての項目が入力されていれば購入できる' do
        expect(@order).to be_valid
      end
      it 'bilding_nameは空でも保存できること' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end

    context '異常系' do
      it 'tokenが空だと保存できないこと' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと保存できないこと' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeがハイフンを含んだ正しい形式でないと保存できないこと' do
        @order.post_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end
      it 'todoufukenn_idがない場合は登録できないこと' do
        @order.todoufukenn_id = 1
        @order.valid?
        expect(@order.errors[:todoufukenn_id]).to include('must be other than 1')
      end
      it 'cityが空だと保存できないこと' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'city_addressが空だと保存できないこと' do
        @order.city_address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁を超過すると保存できないこと' do
        @order.phone_number = 111_111_111_111
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
