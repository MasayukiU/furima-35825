require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it '必要な情報を適切に入力して「出品する」と登録できる' do
        expect(@item).to be_valid
      end
    end
  end
  
  context '商品出品できないとき' do
    it '商品画像を1枚つけることが必須' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it '商品名が空では登録できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Item name can't be blank"
    end
    it '商品の説明が必須である' do
      @item.product_description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Product description can't be blank"
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category is not a number"
    end
    it '商品の状態の情報が必須であること' do
      @item.item_condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Item condition is not a number"
    end
    it '配送料の負担の情報が必須であること' do
      @item.shipping_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping charge is not a number"
    end
    it '発送元の地域の情報が必須であること' do
      @item.shipping_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping area is not a number"
    end
    it '発送までの日数の情報が必須であること' do
      @item.estimated_time_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Estimated time is not a number"
    end
    it '価格の情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it '価格は半角数値のみ保存可能であること' do
      @item.price = 'ああああ'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is out of setting range"
    end
    it '価格は、¥300~¥9,999,999の間のみ保存可能であること' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is out of setting range"
    end
  end
end