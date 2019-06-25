FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "#{FFaker::NameJA.name}_#{n}" }

    trait :blogs do
      after(:create) do |user|
        create_list(:blog, 3, user: user)
      end
    end

    trait :tags do
      after(:create) do |user|
        create_list(:tag, 3, users: [user])
      end
    end
  end
end
