FactoryBot.define do
    factory :casestudy_user do
        casestudy
        user {create(:candidate)}
        assessor
        status { 0 }
    end
end