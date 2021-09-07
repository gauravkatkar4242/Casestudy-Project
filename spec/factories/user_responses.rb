FactoryBot.define do
    factory :user_response do
       question
       casestudy_user
       user { create(:candidate) }
       sequence(:response) {|n| "#{casestudy_user.id} * #{user.name} * #{casestudy_user.casestudy.name} * #{question.body} * User Response #{n}"}
    end
end