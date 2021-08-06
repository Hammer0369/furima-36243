FactoryBot.define do
  factory :item do
    name                  { Faker::Name.initials }
    info                  { Faker::Lorem.sentence }
    category_id           { Faker::Number.within(range: 2..11) }
    status_id             { Faker::Number.within(range: 1..7) }
    shipping_fee_id       { Faker::Number.within(range: 2..3) }
    prefecture_id         { Faker::Number.within(range: 2..48) }
    delivery_scheduled_id { Faker::Number.within(range: 2..4) }
    price                 { Faker::Number.number(digits: 4) }
    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
