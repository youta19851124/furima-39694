require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_name_kanaとlast_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
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
      it 'emailは一意性でなければ登録できない' do
        user1 = FactoryBot.create(:user, email: 'test@example.com')
        user2 = FactoryBot.build(:user, email: 'test@example.com')
        @user.valid?
        expect(user2).not_to be_valid
        expect(user2.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@がないと保存できない' do
        @user.email = 'testexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordに全角文字を含むと保存できない' do
        @user.password = 'パスワード123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must contain at least one letter and one digit')
      end
      it 'passwordとpassword_confirmationが一致しなければ登録できない' do
        @user.password_confirmation = '789tyuf'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'pat4'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordは半角英数字混合出なければ登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must contain at least one letter and one digit')
      end
      it 'passwordは半角英数字混合出なければ登録できない' do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must contain at least one letter and one digit')
      end
      it 'お名前(全角)は、名字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'お名前(全角)は、名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前(全角)は、名字が全角（漢字・ひらがな・カタカナ）での入力でなければ登録できない' do
        @user.last_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Input full-width characters')
      end
      it 'お名前(全角)は、名前が全角（漢字・ひらがな・カタカナ）での入力でなければ登録できない' do
        @user.first_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Input full-width characters')
      end
      it 'お名前カナ(全角)は、名字が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'お名前カナ(全角)は、名前が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'お名前カナ(全角)は、名字が全角（カタカナ）での入力でなければ登録できない' do
        @user.last_name_kana = '加藤'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana Input full-width Katakana caracters')
      end
      it 'お名前カナ(全角)は、名前が全角（カタカナ）での入力でなければ登録できない' do
        @user.first_name_kana = '浩二'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Input full-width Katakana caracters')
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
