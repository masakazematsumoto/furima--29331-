FactoryBot.define do
  factory :user do
    nickname { "まさかぜ11" }
    email { Faker::Internet.free_email }
    password { "cocoa1111" }
    password_confirmation { password }
    family_name { "松本" }
    first_name { "勝風" }
    family_name_kana { "マツモト" }
    first_name_kana { "マサカゼ" }
    birth_day { "2014-10-12" }
  end
end