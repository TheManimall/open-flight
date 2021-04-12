FactoryBot.define do
  factory :airline, class: Airline do
    association :user
    name { "United Airlines" }
    image_url { "https://open-flights.s3.amazonaws.com/United-Airlines.png" }
    popularity { 8 }
    country { "USA" }
   end
end

FactoryBot.define do
  factory :random_airline, class: Airline do
    association :user
    name { Faker::Company.name }
    image_url { Faker::LoremFlickr.image }
    popularity { rand (1..10) }
    country { Faker::Address.country }
  end
end

