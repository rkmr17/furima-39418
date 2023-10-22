class DeliveryInformation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :order

  # ActiveHash
  belongs_to :shipping_area
  ##############################
end
