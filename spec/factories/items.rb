FactoryBot.define do
  factory :item do
    name             { Faker::Commerce.product_name }
    description      { Faker::Lorem.sentence }
    category_id      { Faker::Number.between(from: 1, to: 10) }
    status_id        { Faker::Number.between(from: 1, to: 6) }
    shipping_cost_id { Faker::Number.between(from: 1, to: 2) }
    prefecture_id    { Faker::Number.between(from: 1, to: 47) }
    shipping_day_id  { Faker::Number.between(from: 1, to: 3) }
    price            { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
