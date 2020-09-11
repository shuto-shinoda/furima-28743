require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "ニックネームが必須であること" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "メールアドレスが必須であること" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "パスワードが必須であること" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードは6文字以上であること" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードは半角英数字混合であること" do
      @user.password = "password0"
      @user.password_confirmation = "password0"
      @user.valid?
      expect(@user).to be_valid
    end

    it "パスワードは確認用を含めて2回入力すること" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "first_nameが必須であること" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "first_nameは全角（漢字・ひらがな・カタカナ）で入力させること" do
      @user.first_name{"篠田"}
      @user.valid?
      expect(@user).to be_valid
    end

    it "second_nameが必須であること" do
      @user.second_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name can't be blank")
    end

    it "second_nameがは全角（漢字・ひらがな・カタカナ）で入力させること" do
      @user.second_name{"秀斗"}
      @user.valid?
      expect(@user).to be_valid
    end

    it "first_name_kanaが必須であること" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "first_name_kanaは全角（カタカナ）で入力させること" do
      @user.first_name_kana{"シノダ"}
      @user.valid?
      expect(@user).to be_valid

    end

    it "second_name_kana_kanaが必須であること" do
      @user.second_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Second name kana can't be blank")
    end

    it "second_name_kanaは全角（カタカナ）で入力させること" do
      @user.second_name_kana{"シュウト"}
      @user.valid?
      expect(@user).to be_valid
    end

    it "生年月日が必須であること" do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")  
    end
  end
end