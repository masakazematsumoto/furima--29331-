require 'rails_helper'

describe Item do
  before do
    @user = FactoryBot.build(:item)
    @item.image = fixture_file_upload(‘sample_test.png’)
  end

  describe "商品出品情報の登録" do
    context "商品出品情報が保存できる時" do

      it "image, name, description, category_id, condition_id, postage_id, prefecture_id, handling_time_id, priceが存在すれば保存できること" do
        expect(@item).to be_valid
      end

      it "priceが半角数字なら保存できる" do
        @item.price = "1000"
        expect(@item).to be_valid
      end


    context "商品出品情報の登録がうまくいかないとき" do

      it "imageが空では保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameが空では保存できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "descriptionが空では保存できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "category_idが空では保存できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end

      it "category_idをid:1を選択していると保存できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end

      it "condition_idが空では保存できない" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition Select")
      end

      it "condition_idをid:1を選択していると保存できない" do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition Select")
      end

      it "postage_idが空では保存できない" do
        @item.postage_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage select")
      end

      it "postage_idをid:1を選択していると保存できない" do
        @item.postage_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage select")
      end

      it "prefecture_idが空では保存できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture select")
      end

      it "prefecture_idをid:1を選択していると保存できない" do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture select")
      end

      it "prefecture_idが空では保存できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture select")
      end

      it "prefecture_idをid:1を選択していると保存できない" do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture select")
      end

      it "handling_time_idが空では保存できない" do
        @item.handling_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("HandlingTime select")
      end

      it "handling_time_idをid:1を選択していると保存できない" do
        @item.handling_time_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("HandlingTime select")
      end

      it "priceが空では保存できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price Half-width number", "Price Out of setting range")
      end

      it "priceが300円より小さいと保存できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it "priceが9,999,999円より大きいと保存できない" do
        @item.price = "10,000,000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it "priceが半角数字でないと保存できない" do
        @item.handling_time_id = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number", "Price Out of setting range")
      end
