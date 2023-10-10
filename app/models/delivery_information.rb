class DeliveryInformation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  validates :postal_code,      presence: true
  validates :shipping_area_id, presence: true, numericality: { other_than: 1}
  validates :city,             presence: true
  validates :street_address,   presence: true
  validates :building_name
  validates :phone_number,     presence: true

  belongs_to :order

  # ActiveHash
  belongs_to :shipping_area
  ##############################
end
