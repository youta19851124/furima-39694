class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :zip_code, :shipping_area_id, :city, :street, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :street
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(item_id:, user_id:)
    Address.create(zip_code:, shipping_area_id:, city:, street:,
                   building_name:, phone_number:, order_id: order.id)
  end
end
