FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    introduction {Faker::Lorem.sentence}
    association :user
    price           {1111}
    condition_id       {2}
    postage_payer_id   {2}
    prefecture_code_id {2}
    preparation_day_id {2}
    category_id        {2}

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'test_image.png')
    end
  end
end