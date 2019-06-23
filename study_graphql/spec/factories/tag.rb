FactoryBot.define do
  factory :tag do
    sequence(:name) { |n| "#{FFaker::LoremJA.word}_#{n}" }
  end
end