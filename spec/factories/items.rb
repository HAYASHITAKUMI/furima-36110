FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    product_name       {'商品名'}
    description        {'商品の説明'}
    category_id        { 2 }
    status_id          { 2 }
    burden_id          { 2 }
    delivery_id        { 2 }
    days_delivery_id   { 2 }
    price              { 300 }
  end
end
