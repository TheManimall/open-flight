# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'

users = User.create([
  {
    first_name: "Yurii",
    last_name: 'Vovk',
    email: 'yuriivovk@email.com',
    role: 'admin'
  },
  {
    first_name: "Ivan",
    last_name: 'Voloshka',
    email: 'voloshkak@email.com',
    role: 'user'
  }
])

airlines = Airline.create([
  {
    name: "United Airlines",
    image_url: "https://open-flights.s3.amazonaws.com/United-Airlines.png",
    popularity: rand(1..10),
    country: "USA",
    user: users.first
  },
  {
    name: "Southwest",
    image_url: "https://open-flights.s3.amazonaws.com/Southwest-Airlines.png",
    popularity: rand(1..10),
    country: "Canada",
    user: users.second
  },
  {
    name: "Delta",
    image_url: "https://open-flights.s3.amazonaws.com/Delta.png",
    popularity: rand(1..10),
    country: "USA",
    user: users.first
  },
  {
    name: "Alaska Airlines",
    image_url: "https://open-flights.s3.amazonaws.com/Alaska-Airlines.png",
    popularity: rand(1..10),
    country: "USA",
    user: users.first
  },
  {
    name: "JetBlue",
    image_url: "https://open-flights.s3.amazonaws.com/JetBlue.png",
    popularity: rand(1..10),
    country: "Ukraine",
    user: users.second
  },
  {
    name: "American Airlines",
    image_url: "https://open-flights.s3.amazonaws.com/American-Airlines.png",
    popularity: rand(1..10),
    country: "USA",
    user: users.first
  },
  {
    name: "FlyFree",
    image_url: "https://open-flights.s3.amazonaws.com/American-Airlines.png",
    popularity: rand(1..10),
    country: "Ukraine",
    user: users.first
  }
])

10.times do
  FactoryBot.create :random_airline
end

reviews = Review.create([
           {
             title: 'Great airline',
             description: 'I had a lovely time.',
             score: 5,
             airline: airlines.first
           },
           {
             title: 'Bad airline',
             description: 'I had a bad time',
             score: 1,
             airline: airlines.first
           }
         ])