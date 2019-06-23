FactoryBot.define do
  factory :blog do
    name { FFaker::LoremJA.sentence }
    text { FFaker::LoremJA.paragraphs }
  end
end