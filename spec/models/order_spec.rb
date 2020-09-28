require 'rails_helper'

describe Item do

  before do
    @order = FactoryBot.build(:order)
    @order.image = fixture_file_upload('sample_test.png')
  end

  describe "住所情報の登録" do
    context "住所情報が保存できる時" do

      it "post_code, prefecture_id, city, address, building_name, phone_numberが存在すれば保存できること" do
        expect(@order).to be_valid
      end

    end
  end









end
