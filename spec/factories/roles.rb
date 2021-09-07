FactoryBot.define do
  factory :role do

    trait :candidate_role_trait do
      name { "Candidate" }
    end
    trait :assessor_role_trait do
      name { "Assessor" }
    end
    trait :cc_role_trait do
      name { "Content Creator" }
    end


    factory :candidate_role, traits: [:candidate_role_trait]
    factory :assessor_role, traits: [:assessor_role_trait]
    factory :cc_role, traits: [:cc_role_trait]

  end
end
