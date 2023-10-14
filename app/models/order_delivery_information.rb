class OrderDeliveryInformation
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :street_address, :building_name, :phone_number, :item_id, :user_id

  validates :postal_code,      presence:    true, format:       { with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :shipping_area_id, presence:    true, numericality: { other_than: 1 }
  validates :city,             presence:    true
  validates :street_address,   presence:    true
  validates :phone_number,     presence:    true, format:       { with: /\A\d{10,11}\z/ }
  validates :user_id,          presence: true
  validates :item_id,          presence: true

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    DeliveryInformation.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end