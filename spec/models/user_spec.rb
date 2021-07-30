require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context 'ユーザー登録ができる場合' do
      it '全ての項目の入力が正しいとき登録できる' do
        @user
        expect(@user).to be_valid
      end
    end
  context 'ユーザー登録ができない場合' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
# ・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・・
    it 'password:半角英数混合(半角英語のみ)' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'password:半角英数混合(半角数字のみ)' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'password:全角' do
      @user.password = 'pass'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameは全角（漢字）でなければ登録できない' do
      @user.last_name= '123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it 'last_nameは全角（ひらがな）でなければ登録できない' do
      @user.last_name = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it 'last_nameは全角（カタカナ）でなければ登録できない' do
      @user.last_name = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it 'first_nameは全角（漢字）でなければ登録できない' do
      @user.first_name = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'first_nameは全角（ひらがな）でなければ登録できない' do
      @user.first_name = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'first_nameは全角（カタカナ）でなければ登録できない' do
      @user.first_name = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'first_name_kanaはカタカナでなければ登録できない' do
      @user.first_name_kana = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it 'last_name_kanaはカタカナでなければ登録できない' do
      @user.last_name_kana = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it 'emailは@が含まれていないと登録ができない' do
      @user.email = '@'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it '同じemailは登録できない（一意性）' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
  end

  end
end
