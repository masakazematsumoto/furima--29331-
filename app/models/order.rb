class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :purchaser
  belongs_to_active_hash :prefecture
end
