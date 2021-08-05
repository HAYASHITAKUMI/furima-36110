require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = @user = FactoryBot.build(:item)
  end

    it '商品名が必須であること' do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it '商品の状態の情報が必須であること' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it '配送料の負担の情報が必須であること' do
      @item.burden_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it '発送元の地域の情報が必須であること' do
      @item.delivery_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it '発送までの日数の情報が必須であること' do
      @item.days_delivery_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it '価格の情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it '価格は、¥300以下では登録できないこと' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it '価格は、¥10000000' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
end

