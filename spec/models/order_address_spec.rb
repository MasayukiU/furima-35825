require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '新規購入' do
    context '新規購入できるとき' do
        it 'postal_codeとshipping_area_idとcityとhouse_numberとfirst_nameとphone_numberが存在すれば登録できる' do
          expect(@order_address).to be_valid
        end
        it '建物名の記入がなくても登録できること' do
          @order_address.building_name = ''
          expect(@order_address).to be_valid
        end
      end

    context '新規購入できないとき' do
      it '郵便番号が空では登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it '郵便番号が数字3桁、ハイフン、数字4桁の並びのみ許可する' do
        @order_address.postal_code = '22_44-66'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it '郵便番号にハイフンが入っていない場合登録できない' do
        @order_address.postal_code = '224466'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it '都道府県が空では登録できない' do
        @order_address.shipping_area_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Shipping area can't be blank"
      end
      it '都道府県がidが0の選択肢を選択するとでは登録できない' do
        @order_address.shipping_area_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Shipping area can't be blank"
      end
      it '市区町村が空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it '番地が空では登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "House number can't be blank"
      end
      it '電話番号が空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it '電話番号が半角英数字混合だと登録できない' do
        @order_address.phone_number = '090aaaa1234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end
      it '電話番号が全角数字だと登録できない' do
        @order_address.phone_number = '０９０１２３４１２３４'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end
      it '電話番号が12桁以上だと登録できない' do
        @order_address.phone_number = '090123456789101112'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end
      it '10桁以上11桁以内の半角数値のみでしか登録できない' do
        @order_address.phone_number = '090-1234-1234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
      it 'item_idが空では購入できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end
      it 'user_idが空では購入できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
    end
  end
end
