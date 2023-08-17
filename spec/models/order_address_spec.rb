require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入記録の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも購入できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号は空では保存できないこと' do
        @order_address.zip_code = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code can't be blank")
      end
      it '郵便番号は『３桁ハイフン４桁』半角英数字でないと保存できないこと' do
        @order_address.zip_code = '123-123４'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip code is invalid. Include hyphen(-)')
      end
      it '都道府県に「---」が選択されている場合は購入できないこと' do
        @order_address.shipping_area_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '市区町村が空だと購入できないこと' do
        @order_address.city = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できないこと' do
        @order_address.street = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street can't be blank")
      end
      it '電話番号が空だと購入できないこと' do
        @order_address.phone_number = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下だと購入できないこと' do
        @order_address.phone_number = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上だと購入できない' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が半角数値でないと購入できないこと' do
        @order_address.phone_number = '０9012341234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'user_idが紐づいていなければ購入できないこと' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていなければ購入できないこと' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
