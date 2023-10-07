FactoryBot.define do
  factory :item do
    item_name          { Faker::Commerce.product_name }
    description        { Faker::Lorem.sentence }
    category           { Category.where.not(id: 1).sample }
    condition          { Condition.where.not(id: 1).sample }
    delivery_cost      { DeliveryCost.where.not(id: 1).sample }
    shipping_area      { ShippingArea.where.not(id: 1).sample }
    shipping_lead_time { ShippingLeadTime.where.not(id: 1).sample }
    price              { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
