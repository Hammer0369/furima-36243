class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery_scheduled
  has_one_attached :image
  belongs_to :user
  has_one :order

  with_options presence: true do
    validates :image, :name, :info
    validates :price, format: { with: /\A[0-9]+\z/, allow_blank: true },
                      inclusion: { in: 300..9_999_999, message: 'is out of setting range', allow_blank: true },
                      numericality: true
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_scheduled_id
  end
end
