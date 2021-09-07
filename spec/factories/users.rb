FactoryBot.define do
    factory :user do
        
        trait :user_candidate do
            sequence(:name , 'a') { |n| "candiate #{n}" }
            sequence(:email) { |n| "candiate#{n}@example.com" }
            password { "qazqaz" }
        end

        trait :user_assessor do
            sequence(:name , 'a') { |n| "assessor #{n}" }
            sequence(:email) { |n| "assessor#{n}@example.com" }
            password { "qazqaz" }
        end

        trait :user_cc do
            sequence(:name , 'a') { |n| "ContentCreator #{n}" }
            sequence(:email) { |n| "cc#{n}@example.com" }
            password { "qazqaz" }
        end

        before(:create) do
          create(:candidate_role) if !Role.exists?(name: "Candidate")
        end

        trait :assign_assessor_role do
            after(:create) do |user|
                user.roles << create(:assessor_role) if !Role.exists?(name: "Assessor")
            end
        end

        trait :assign_cc_role do
            after(:create) do |user|
                user.roles << create(:cc_role) if !Role.exists?(name: "Content Creator")
            end
        end

        factory :candidate, traits: [:user_candidate]
        factory :assessor, aliases: [:creator], traits: [:user_assessor, :assign_assessor_role]
        factory :cc, traits: [:user_cc, :assign_cc_role]
    end
end


