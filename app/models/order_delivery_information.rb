class OrderDeliveryInformation
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :street_address, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(item_id:, user_id:)
    DeliveryInformation.create(postal_code:, shipping_area_id:, city:,
                               street_address:, building_name:, phone_number:, order_id: order.id)
  end
end
