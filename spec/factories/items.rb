FactoryBot.define do
  factory :item do
    item_name { "MyString" }
    item_description { "MyText" }
    category_id { 1 }
    item_state_id { 1 }
    delivery_charge_burden_id { 1 }
    prefecture_id { 1 }
    delivery_date_id { 1 }
    price { 1 }
    user { nil }
  end
end
