require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:item) { FactoryBot.create(:item) }
  
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '購入がうまくいくとき' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'postが空だと保存できない' do
        @order_form.post = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post can't be blank")
      end

      it 'postが無効なフォーマットだと保存できない' do
        @order_form.post = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post is invalid")
      end

      it 'prefecture_idが1だと保存できない' do
        @order_form.prefecture_id = '1'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと保存できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
    
      it 'blockが空だと保存できない' do
        @order_form.block = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Block can't be blank")
      end
    
      it 'phone_numberが空だと保存できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが10桁未満だと保存できないこと' do
        @order_form.phone_number = '123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
      end

      it 'phone_numberが12桁以上だと保存できない' do
        @order_form.phone_number = '123456789012'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    
      it 'phone_numberが英数字混合だと保存できない' do
        @order_form.phone_number = 'abc12345678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが全角数値だと保存できないこと' do
        @order_form.phone_number = '１２３４５６７８９０'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
    
      it 'user_idが空だと保存できない' do
        @order_form.user_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
    
      it 'item_idが空だと保存できない' do
        @order_form.item_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    
      it 'tokenが空だと保存できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end