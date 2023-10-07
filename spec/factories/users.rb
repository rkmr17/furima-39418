FactoryBot.define do
  factory :user do
    Faker::Config.locale = 'ja'
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.email }
    password              { "1a#{Faker::Internet.password(min_length: 4)}" }
    password_confirmation { password }
    last_name             { Faker::Name.last_name }
    first_name            { Faker::Name.first_name }
    kana_last_name        { 'カナ' }
    kana_first_name       { 'カナ' }
    birth_date            { Faker::Date.birthday }
  end
end
