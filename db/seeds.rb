# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'faker'
require 'json'
require 'net/http'
require 'uri'

# USER
puts "Cleaning database for users..."
User.destroy_all

puts "Creating users..."
10.times do
  User.create!(
    email: Faker::Internet.email,
    name: Faker::Name.name,
    password: "123456"
  )
end
puts "Finished creating users!"

# CAUSE
puts "Cleaning database for causes..."
Cause.destroy_all

puts "Creating causes..."
Cause.create!(name: "Animal Welfare")
Cause.create!(name: "Arts, Culture and Humanities")
Cause.create!(name: "Children and Youth")
Cause.create!(name: "Community Development")
Cause.create!(name: "Education")

puts "Finished creating causes!"

# CHARITY
puts "Cleaning database for charities..."
Charity.destroy_all


puts "Creating charities..."
20.times do
  res = ""
  res = Net::HTTP.get_response(URI('https://source.unsplash.com/random/700%C3%97700/?charity'))
  Charity.create!(
    name: Faker::Company.name,
    image: res['location'],
    description: Faker::Lorem.paragraph,
    address: Faker::Address.full_address,
    accepting: true,
    user: User.all.sample,
    cause: Cause.all.sample
  )
end
puts "Finished creating charities!"

# DONATION
puts "Cleaning database for donations..."
Donation.destroy_all

puts "Creating donations..."
100.times do
  started = Date.today - rand(365)
  ended = started + rand(365)
  Donation.create!(
    donations_amount: rand(1..1000),
    started: started,
    ended: ended,
    user: User.all.sample,
    charity: Charity.all.sample
  )
end
