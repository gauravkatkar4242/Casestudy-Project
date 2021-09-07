FactoryBot.define do
    factory :question_trait do
        question
        trait_id {create(:trait1).id}
    end
end