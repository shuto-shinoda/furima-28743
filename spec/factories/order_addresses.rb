FactoryBot.define do
  factory :order_address do
    post_code {"123-4567"}
    prefecture_id {2}
    city {"世田谷区"}
    house_number {111-1}
    building_name {"ビル"}
    phone_number {"09012345678"}
  end
end
