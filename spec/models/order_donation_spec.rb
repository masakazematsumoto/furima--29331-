require 'rails_helper'

describe OrderDonation do
  before do
    @order_donation = FactoryBot.build(:order_donation)
  end

  describe "購入情報の保存" do
    context "購入情報が保存できる時" do

    it "post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :tokenの値が存在すれば保存できること" do
      expect(@order_donation).to be_valid
    end

    it "building_nameは空でも保存できること" do
    @order_donation.building_name = nil
    expect(@order_donation).to be_valid
    end
  end


    context "購入情報が保存できない時" do

      it "post_codeが空では保存できない"do
      @order_donation.post_code = nil
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
      end

      it "prefecture_idが空では保存できない"do
      @order_donation.prefecture_id = nil
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空では保存できない"do
      @order_donation.city = nil
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("City can't be blank")
      end

      it "addressが空では保存できない"do
      @order_donation.address = nil
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberが空では保存できない"do
      @order_donation.phone_number = nil
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("Phone number can't be blank", "Phone number is not a number")
      end

      it "tokenが空では保存できない"do
      @order_donation.token = nil
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include()
      end

      it "post_codeがハイフンなしでは保存できない"do
      @order_donation.post_code = '1234567'
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("Post code is invalid")
      end

      it "phone_numberにハイフンが入っていれば保存できない"do
      @order_donation.phone_number = '090-1234-5678'
      @order_donation.valid?
      expect(@order_donation.errors.full_messages).to include("Phone number is not a number")
      end
    end

    end
  end
