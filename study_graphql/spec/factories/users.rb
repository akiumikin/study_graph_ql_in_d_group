FactoryBot.define do
  factory :user do
    name { FFaker::NameJA.name }

    after(:create) do |user|
      create_list(:blog, 3, user: user)
    end

    after(:create) do |user|
      create_list(:tag, 3, users: [user])
    end
  end
end
