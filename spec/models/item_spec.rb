require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "出品商品情報の登録" do
    it "すべての情報が正しいフォーマットで入力されていれば登録できる" do
      expect(@item).to be_valid
    end

    it "nameが空では登録できないこと" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "explanationが空では登録できないこと" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it"category_idが空では登録できないこと" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
    end

    it "conditionが空では登録できないこと" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "pay_idが空では登録できないこと" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "area_idが空では登録できないこと" do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area is not a number")
    end

    it "priceが300円未満だと登録できないこと" do
        @item.price = "300"
        @item.valid?
        expect(@item).to be_valid
    end

    it "priceが9,999,999円を超えると登録できないこと" do
       @item.price = "9999999"
       @item.valid?
       expect(@item).to be_valid
    end

    it "priceが半角数字であること" do
      @item.price = "あああ"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
