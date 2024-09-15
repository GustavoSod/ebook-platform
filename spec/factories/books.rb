FactoryBot.define do
  factory :book do
    title { "MyString" }
    description { "MyText" }
    user { nil }
    pdf { "MyString" }
    image { "MyString" }
  end
end
