require 'rails_helper'

RSpec.describe Purchase, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  describe '商品購入機能' do
    context '商品購入ができる場合' do
      it '全ての項目の入力が存在すれば登録できる' do
        @purchase
        expect(@purchase).to be_valid
      end
    end
  end

  context '商品購入ができない場合' do
    it '郵便番号が必須であること' do
      @purchase.address = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("")
    end
    it 'delivery_idが1の場合は登録できない' do
      @purchase.delivery_id = 1
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("")
    end
    it '市区町村が必須であること。' do
      @purchase.municipality = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("")
    end
    it '番地が必須であること。' do
      @purchase.address = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("")
    end
    it '建物名は任意であること。' do
      @purchase.building_name = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("")
    end
    it '電話番号が必須であること。' do
      @purchase.phone_number = ''
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("")
    end
    it '郵便番号は、全角文字列では登録出来ない' do
      @purchase.address = '１２３ー４５６７'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("")
    end
    it '郵便番号は、ハイフンなしでは登録出来ない' do
      @purchase.address = '-'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("")
    end
    it '電話番号は、9桁以下では登録できない' do
      @purchase.phone_number = '123456789'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("")
    end
    it '電話番号は、12桁以上では登録できない' do
      @purchase.phone_number = '123456789012'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("")
    end
    it '電話番号は、全角では登録できない' do
      @purchase.phone_number = '１２３４５６７８９０'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("")
    end
  end
end