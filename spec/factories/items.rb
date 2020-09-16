FactoryBot.define do
  factory :item do
    name { "画像" }
    description { "背景画像" }
    category_id { '2' }
    condition_id { '2' }
    postage_id { '2' }
    prefecture_id { '2' }
    handling_time_id { '2' }
    price { '1000' }
    association :user
  end
end
