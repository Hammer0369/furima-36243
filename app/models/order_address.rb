class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    varidates :city, :house_number
    varidates :phone_number, format: {with: /^\d{10}$|^\d{11}$/, message: "number is invalid. Input only number"}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end