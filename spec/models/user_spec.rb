require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "新規登録/ユーザー情報" do
    
    it "全ての項目の入力が存在すれば登録できること" do
      @user.valid?
      expect(@user).to be_valid
    end
    
    it "ニックネームが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "メールアドレスが空だと登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したメールアドレスが、テーブル内に存在すれば登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email 
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "メールアドレスは、＠がないと登録できない" do
      @user.email = "abcgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email には＠を含めて設定してください")
    end
    it "パスワードが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは、5文字以下なら登録できない" do
      @user.password = '111aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードは、半角英数字混合でなければ登録できない" do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it "パスワード（確認用）が空だと登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードとパスワード（確認用）は、値が不一致であれば登録できない" do
      @user.password = "000aaa"
      @user.password_confirmation = "111aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "ユーザー本名は、名字が空だと登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "ユーザー本名は、名字が全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name には全角文字を使用してください")
    end
    it "ユーザー本名は、名前が空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "ユーザー本名は、名前が全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name には全角文字を使用してください")
    end
    it "ユーザー本名のフリガナは、名字が空だと登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "ユーザー本名のフリガナは、名字が全角（カタカナ）でなければ登録できない" do
      @user.last_name_kana = 'ひらがな'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana には全角カタカナを使用してください")
    end
    it "ユーザー本名のフリガナは、名前が空だと登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "ユーザー本名のフリガナは、名前が全角（カタカナ）でなければ登録できない" do
      @user.first_name_kana = 'ひらがな'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana には全角カタカナを使用してください")
    end
    it "生年月日が空だと登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
