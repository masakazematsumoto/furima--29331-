class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :user
  has_one_to_active_hash :purchaser
  has_one_attached :image

  validates :category_id, :condition_id, :postage_id, :prefecture_id, :handling_time_id, { other_than: 1 } 

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true,length: { maximum: 1000 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 300, less_than: 9,999,999}, format: { with: /^[0-9]+$/, }
end
