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
    it 'emailは@が含まれていない場合登録できない' do
      @user.email = 'hogehuga.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = 'a1a1'
      @user.password_confirmation = 'a1a1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
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
    it 'passwordは英字のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordは数字のみでは登録できない' do
      @user.password = '222222'
      @user.password_confirmation = '222222'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordは全角文字を含む場合登録できない' do
      @user.password = 'ＡＢｃ１'
      @user.password_confirmation = 'ＡＢｃ１'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'firstname_kannjiは半角文字が含まれていると登録できない' do
      @user.firstname_kannji = 'あAｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Firstname kannji is invalid')
    end
    it 'lastname_kannjiは半角文字が含まれていると登録できない' do
      @user.lastname_kannji = 'あAｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Lastname kannji is invalid')
    end
    it 'firstname_katakanaは平仮名・漢字・英数字・記号が含まれていると登録できない' do
      @user.firstname_katakana = 'あ亜ｱ1@'
      @user.valid?
      expect(@user.errors.full_messages).to include('Firstname katakana is invalid')
    end
    it 'lastname_katakanaは平仮名・漢字・英数字・記号が含まれていると登録できない' do
      @user.lastname_katakana = 'あ亜ｱ1@'
      @user.valid?
      expect(@user.errors.full_messages).to include('Lastname katakana is invalid')
    end
  end
end
