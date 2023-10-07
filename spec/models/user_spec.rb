require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができない' do
     it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
     end
     it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
     end
     it '重複したemailは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
     end
     it '@を含まないemailは登録できない' do
      @user.email = "testmail"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
     end
     it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
     end
     it 'passwordが6文字未満では登録できない' do
      @user.password = '1aA45'
      @user.password_confirmation = '1aA45'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
     end
     it 'passwordは英字のみでは登録できない' do
      @user.password = 'aAbBcC'
      @user.password_confirmation = 'aAbBcC'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers."
     end
     it 'passwordは数字のみでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers."
     end
     it 'passwordは全角が含まれていては登録できない' do
      @user.password = '1aA45Ａ'
      @user.password_confirmation = '1aA45Ａ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers."
     end
     it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '1aA456'
      @user.password_confirmation = '1aA456c'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
     end
     it "last_nameが空では登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
     end
     it "last_nameに半角文字が含まれていると登録できない" do
      @user.last_name = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid. Input full-width characters"
     end
     it "first_nameが空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
     end
     it "first_nameに半角文字が含まれていると登録できない" do
      @user.first_name = 'taro'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters"
     end
     it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
     end
     it "last_name_kanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.last_name_kana = 'た中1Aa@'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid. Input full-width katakana characters"
     end
     it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
     end
     it "first_name_kanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.first_name_kana = 'た郎1Aa@'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid. Input full-width katakana characters"
     end
     it "date_of_birthが空では登録できない" do
      @user.date_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Date of birth can't be blank"
     end
    end
  end
end

