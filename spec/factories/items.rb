FactoryBot.define do
  factory :item do
    name { "画像" }
    description { "背景画像" }
    category_id { 1 }
    condition_id { 1 }
    postage_id { 1 }
    prefecture_id { 1 }
    handling_time_id { 1 }
    price { 1000 }
    association :user
  end
end
