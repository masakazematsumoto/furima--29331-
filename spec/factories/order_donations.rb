FactoryBot.define do
  factory :order_donation do
    post_code { "555-0000"}
    prefecture_id { "1" }
    city { "大阪市" }
    address { "1-2-3" }
    building_name { "大阪ビル" }
    phone_number { "09012345678" }
    token {}
  end
end
