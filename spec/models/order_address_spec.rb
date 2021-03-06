require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe 'クレジット情報と発送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題がない場合' do
      it 'tokenがあれば保存できる' do
        expect(@order_address).to be_valid
      end
      it '発送先情報の値が全て正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと保存できない' do
        @order_address.phone_number = '０８０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only half-width number of 10 to 11 characters')
      end
      it 'phone_numberが10桁未満だと保存できない' do
        @order_address.phone_number = '080123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only half-width number of 10 to 11 characters')
      end
      it 'phone_numberに半角数字以外の文字が入力されていると保存できない' do
        @order_address.phone_number = '080-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only half-width number of 10 to 11 characters')
      end
      it 'phone_numberが12桁以上だと保存できない' do
        @order_address.phone_number = '080123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only half-width number of 10 to 11 characters')
      end
      it 'phone_numberが英数字混合だと保存できない' do
        @order_address.phone_number = '080abcdefgh'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only half-width number of 10 to 11 characters')
      end
    end
  end
end
