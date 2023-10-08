FactoryBot.define do
  factory :item do
    product_name { Faker::Commerce.product_name }
    product_description { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    product_condition_id { Faker::Number.between(from: 2, to: 7) }
    shipping_fee_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    shipping_time_id { Faker::Number.between(from: 2, to: 4) }
    priced { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user, factory: :user
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'factories', 'images', 'sample.png'), 'image/png') }
  end
end
