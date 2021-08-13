class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)', allow_blank: true }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/,
                                       message: 'is invalid. Input only half-width number of 10 to 11 characters',
                                       allow_blank: true }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end
