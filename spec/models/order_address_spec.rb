require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user1.id)
    @orderaddress = FactoryBot.build(:order_address, user_id: @user2.id, item_id: @item.id)
  end

  describe "購入内容の確認" do
   context "登録できるケース" do
    it "すべての情報が正しいフォーマットで入力されていれば登録できる" do
      expect(@orderaddress).to be_valid
    end

    it"building_nameが空でも登録できること" do
      @orderaddress.building_name = ''
      expect(@orderaddress).to be_valid
    end
   end
  

   context "登録ができないケース" do
    it "postal_codeが空では登録できないこと" do
        @orderaddress.postal_code = ''
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Postal code can't be blank")
    end

    it "postal_codeにはハイフンが必要であること" do
      @orderaddress.postal_code = ''
      @orderaddress.valid?
      expect(@orderaddress.errors.full_messages).to include("Postal code can't be blank")
    end

    it "prefecture_idは1では登録できないこと" do
        @orderaddress.prefecture_id = '1'
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "prefecture_idが空では登録できないこと" do
      @orderaddress.prefecture_id = ''
      @orderaddress.valid?
      expect(@orderaddress.errors.full_messages).to include("Prefecture can't be blank")
    end

    it"municipalityが空では登録できないこと" do
        @orderaddress.municipality = ''
        @orderaddress.valid?
        expect(@orderaddress.errors.full_messages).to include("Municipality can't be blank")
    end

    it"addressが空では登録できないこと" do
      @orderaddress.address = ''
      @orderaddress.valid?
      expect(@orderaddress.errors.full_messages).to include("Address can't be blank")
    end

    it"phone_numberが空では登録できないこと" do
      @orderaddress.phone_number = ''
      @orderaddress.valid?
      expect(@orderaddress.errors.full_messages).to include("Phone number can't be blank")
    end

    it"phone_numberは11桁以内でないと登録できないこと" do
      @orderaddress.phone_number = '000000000000'
      @orderaddress.valid?
      expect(@orderaddress.errors.full_messages).to include("Phone number is invalid")
    end
   end
  end
end
