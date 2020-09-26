FactoryBot.define do
  factory :card do
    number { "4242424242424242" }
    exp_month { "3" }
    exp_year { "24" }
    cvc { "123" }
  end
end
