FactoryBot.define do
  factory :casestudy do
    
      sequence(:name) { |n| "Casestudy #{n}" }
      duration { 100 }
      scale {10}
      passkey {'qazqaz'}
      creator { create(:cc) }
    
  end
end
