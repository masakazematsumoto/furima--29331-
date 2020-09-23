class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :purchaser
  belongs_to_active_hash :prefecture

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  with_options presence: true do
    validates :post_code, numericality: { only_integer: true, with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true, with: /\A\d{11}\z/ }
end
