FactoryBot.define do
  factory :item do
    item_name { "Sample Item" }
    item_description { "This is a sample item description." }
    category_id { 2 }
    item_state_id { 2 }
    delivery_charge_burden_id { 2 }
    prefecture_id { 2 }
    delivery_date_id { 2 }
    price { 1000 }
    user 
  end

  factory :item_without_user, parent: :item do
    user { nil }
  end
end
