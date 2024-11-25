FactoryBot.define do
  factory :application do
    name { "MyString" }
    description { "MyText" }
    access_token { "MyString" }
    user { nil }
  end
end
