class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  validates :image,                 presence: true
  validates :item_name,             presence: true
  validates :description,           presence: true
  validates :category_id,           presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,          presence: true, numericality: { other_than: 1 }
  validates :delivery_cost_id,      presence: true, numericality: { other_than: 1 }
  validates :shipping_area_id,      presence: true, numericality: { other_than: 1 }
  validates :shipping_lead_time_id, presence: true, numericality: { other_than: 1 }
  validates :price,                 presence: true
  validates :user,                  presence: true

  belongs_to :user

  #ActiveHash
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_cost
  belongs_to :shipping_area
  belongs_to :shipping_lead_time
  ##############################

  has_one_attached :image
end
