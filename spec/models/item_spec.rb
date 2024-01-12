require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録がうまくいくとき' do
      it 'すべての項目が適切に入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'item_nameが空だと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_descriptionが空だと登録できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end

      it 'category_idが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'item_state_idが1だと登録できない' do
        @item.item_state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state can't be blank")
      end

      it 'delivery_charge_burden_idが1だと登録できない' do
        @item.delivery_charge_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge burden can't be blank")
      end

      it 'prefecture_idが1だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'delivery_date_idが1だと登録できない' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end

      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be in 300..9999999")
      end

      it 'priceが9999999を超えると登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be in 300..9999999")
      end

      it 'priceが半角数値でない場合は保存できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')

        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')

        @item.price = '123abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')

        @item.price = '１２３'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
