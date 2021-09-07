FactoryBot.define do
    factory :assessor_response do
       user {create(:candidate)}
       assessor
       casestudy_user
       question_trait
       rating { 10 }
   end
end