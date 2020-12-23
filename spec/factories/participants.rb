FactoryBot.define do
  factory :participant do
    name {'XYZ'}
    age { 34 }
    gender { ['Male', 'Female'].sample }
  end
end