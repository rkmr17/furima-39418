FactoryBot.define do
  factory :order_delivery_information do
    postal_code        { Faker::Address.postcode }
    shipping_area_id   { 2 }
    city               { Faker::Address.city }
    street_address     { Faker::Address.street_address }
    building_name      { Faker::Address.building_number }
    phone_number       { '09012345678' }
    token              { 'tok_abcdefghijk00000000000000000' }
  end
end
