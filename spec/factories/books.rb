FactoryBot.define do
  factory :book do
    title { "O Futuro" }
    description { "O futuro é um file de ação, ele se baseia na criação do universo" }
    author { "Joao" }
    user { association :user }
  end
end
