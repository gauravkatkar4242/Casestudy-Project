FactoryBot.define do
  factory :trait do
    trait :tr1 do
      sequence(:name) { |n| "Trait - #{n}" }
    end

    factory :trait1, traits: [:tr1]
  end
end
