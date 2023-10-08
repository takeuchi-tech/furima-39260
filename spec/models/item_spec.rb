require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品登録できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品登録ができないとき' do
      it '画像が添付されていないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'product_nameが空だと登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product name can't be blank"
      end
      it 'product_nameが40文字以上だと登録できない' do
        @item.product_name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include 'Product name is too long (maximum is 40 characters)'
      end
      it 'product_descriptionが空だと登録できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product description can't be blank"
      end
      it 'product_descriptionが1000文字以上だと登録できない' do
        @item.product_description = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include 'Product description is too long (maximum is 1000 characters)'
      end
      it 'category_idが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'product_condition_idが空だと登録できない' do
        @item.product_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Product condition can't be blank"
      end
      it 'shipping_fee_idが空だと登録できない' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee can't be blank"
      end
      it 'prefecture_idが空だと登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'shipping_time_idが空だと登録できない' do
        @item.shipping_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping time can't be blank"
      end
      it 'pricedが空だと登録できない' do
        @item.priced = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Priced can't be blank"
      end
      it 'pricedが￥300以下だと登録できない' do
        @item.priced = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Priced must be greater than or equal to 300'
      end
      it 'pricedが￥9,999,999以上だと登録できない' do
        @item.priced = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Priced must be less than or equal to 9999999'
      end
      it 'pricedが半角数値でないと登録できない' do
        @item.priced = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Priced is not a number'
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
