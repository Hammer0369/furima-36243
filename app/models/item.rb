class Item < ApplicationRecord
  with_options presence: true do
    validates :image, :name, :info, :price
  end
  has_one_attached :image
  belongs_to :user
  # has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery_scheduled

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_scheduled_id
  end
end