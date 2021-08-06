require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができる場合' do
      it '全ての項目の入力が存在すれば登録できる' do
        @item
        expect(@item).to be_valid
      end
    end

  context '商品出品ができない場合' do
    it 'ユーザーの情報がないと登録できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が必須であること' do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'category_idが1の場合は登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'status_idが1の場合は登録できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it 'burden_idが1の場合は登録できない' do
      @item.burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden can't be blank")
    end
    it 'delivery_idが1の場合は登録できない' do
      @item.delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery can't be blank")
    end
    it 'days_delivery_idが1の場合は登録できない' do
      @item.days_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days delivery can't be blank")
    end
    it '価格の情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not included in the list")
    end
    it '価格は、¥300以下では登録できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it '価格は、¥10000000' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it 'priceが全角では登録できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it 'priceが英字では登録できない' do
      @item.price = 'abcdef'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it 'priceが半角英数混合では登録できない' do
      @item.price = 'abc123'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
  end
 end
end

