FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@crossover.com" }
    password 'password'
  end
end