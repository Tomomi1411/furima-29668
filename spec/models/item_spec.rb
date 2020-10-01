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

    it"category_idは1では登録できないこと" do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "condition_idが空では登録できないこと" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it"condition_idは1では登録できないこと" do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it "pay_idが空では登録できないこと" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it"pay_idは1では登録できないこと" do
      @item.pay_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Pay must be other than 1")
    end

    it "area_idが空では登録できないこと" do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area is not a number")
    end

    it "priceが300円未満だと登録できないこと" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "priceが9,999,999円を超えると登録できないこと" do
       @item.price = "10000000"
       @item.valid?
       expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it "priceが半角数字であること" do
      @item.price = "あああ"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
