FactoryBot.define do
  factory :item do
    item_name            {'アイテムネーム'}
    price                {5000}
    product_description  {'商品詳細'}
    category_id          {2}
		item_condition_id    {2}
		shipping_area_id     {2}
		shipping_charge_id   {2}
		estimated_time_id    {2}
    association :user
    after(:build) do |item|
      item.image.attach(io:  File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
