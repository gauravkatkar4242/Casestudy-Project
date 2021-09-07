FactoryBot.define do
  factory :page do
    casestudy
    sequence(:body) { |n| "#{casestudy.name} Page - #{n}" }
  end
end
