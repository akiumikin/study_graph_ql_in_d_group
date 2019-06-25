FactoryBot.define do
  factory :blog do
    sequence(:name) { |n| "#{FFaker::LoremJA.sentence}_#{n}" }
    text { FFaker::LoremJA.paragraphs }
  end
end