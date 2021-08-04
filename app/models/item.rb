class Item < ApplicationRecord
  with_options presence: true do
    validates :name, :info, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_schedule, :price, :user
  end
  has_one_attached :image
  belongs_to :user
  # has_one :order
end