require 'rails_helper'

RSpec.describe PurchaseResidence, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_residence = FactoryBot.build(:purchase_residence, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '商品購入ができる場合' do
      it '内容に問題がない場合' do
        @purchase_residence
        expect(@purchase_residence).to be_valid
      end
      it '建物名は任意であること。' do
        @purchase_residence.building_name = ''
        @purchase_residence.valid?
        expect(@purchase_residence).to be_valid
      end
    end

  context '商品購入ができない場合' do
    it "tokenが空では登録できないこと" do
      @purchase_residence.token = nil
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が必須であること' do
      @purchase_residence.address = ''
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Address can't be blank")
    end
    it 'delivery_idが1の場合は登録できない' do
      @purchase_residence.delivery_id = 1
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Delivery can't be blank")
    end
    it '市区町村が必須であること。' do
      @purchase_residence.municipality = ''
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Municipality can't be blank")
    end
    it '番地が必須であること。' do
      @purchase_residence.address = ''
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が必須であること。' do
      @purchase_residence.phone_number = ''
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid", "Phone number is invalid")
    end
    it '郵便番号は、全角文字列では登録出来ない' do
      @purchase_residence.postal_code = '１２３ー４５６７'
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Postal code is invalid")
    end
    it '郵便番号は、ハイフンなしでは登録出来ない' do
      @purchase_residence.postal_code = '1234567'
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Postal code is invalid")
    end
    it '電話番号は、9桁以下では登録できない' do
      @purchase_residence.phone_number = '123456789'
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号は、12桁以上では登録できない' do
      @purchase_residence.phone_number = '123456789012'
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号は、全角では登録できない' do
      @purchase_residence.phone_number = '１２３４５６７８９０'
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Phone number is invalid", "Phone number is invalid")
    end
    it 'user_idが空では購入できないこと' do
      @purchase_residence.user_id = ''
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空では購入できないこと' do
      @purchase_residence.item_id = ''
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Item can't be blank")
    end
  end
  end
end