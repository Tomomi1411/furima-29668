require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nameが空では登録できないこと" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it"emailには@が含まれないと登録できないこと" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが5文字以下であれば登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
     expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "surnameが必須であること" do
      @user.surname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname can't be blank")
    end

    it "surnameが全角であること" do
      @user.surname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname can't be blank", "Surname is invalid. Input full-width characters.")
    end

    it "name_kanaが必須であること" do
      @user.name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kana can't be blank")
    end

    it "surname_kanaが必須であること" do
      @user.surname_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kana can't be blank")
    end

    it "name_kanaが全角であること" do
      @user.name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kana can't be blank", "Name kana is invalid. Input full-width katakana characters.")
    end

    it "surname_kanaが全角であること" do
      @user.surname_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kana can't be blank", "Surname kana is invalid. Input full-width katakana characters.")
    end

    it "birthが必須であること" do
      @user.birth = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end
