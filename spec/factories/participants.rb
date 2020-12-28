FactoryBot.define do
  factory :participant do
    sequence :name do |n|
      "name#{n}"
    end
    age { 34 }
    gender { ['Male', 'Female'].sample }
  end
end