FactoryBot.define do
  factory :question do
    casestudy
    sequence(:body) { |n| "#{casestudy.name} Question - #{n}" }
  end
end
