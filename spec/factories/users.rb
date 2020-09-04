FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password = Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
    first_name            {"篠田"}
    second_name           {"秀斗"}
    first_name_kana       {"シノダ"}
    second_name_kana      {"シュウト"}
    birth_date            {"1993-07-18"}
  end
end