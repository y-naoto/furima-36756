require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
    end
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
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = ''
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'nicknameが空では登録できない' do
    end
    it '重複したemailが存在する場合登録できない' do
    end
    it 'passwordが5文字以下では登録できない' do
    end
    it 'firstname_kannjiがない場合は登録できないこと' do
      @user.firstname_kannji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kannji can't be blank")
    end
    it 'lastname_kannjiがない場合は登録できないこと' do
      @user.lastname_kannji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname kannji can't be blank")
    end
    it 'firstname_katakanaがない場合は登録できないこと' do
      @user.firstname_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname katakana can't be blank")
    end
    it 'lastname_katakanaがない場合は登録できないこと' do
      @user.lastname_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname katakana can't be blank")
    end
    it 'birthdayがない場合は登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
