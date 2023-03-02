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
puts "Cleaning database for causes...."
Cause.destroy_all

puts "Creating causes..."
Cause.create!(name: "Animal Welfare")
Cause.create!(name: "Children and Youth")
Cause.create!(name: "Community Development")
Cause.create!(name: "Education")
Cause.create!(name: "Health")
Cause.create!(name: "Women's Empowerment")
Cause.create!(name: "Enviroment")

puts "Finished creating causes!"

# CHARITY
# puts "Cleaning database for charities..."
# Charity.destroy_all

# puts "Creating charities..."
# 20.times do
#   res = ""
#   sleep(1.2)
#   res = Net::HTTP.get_response(URI('https://source.unsplash.com/random/700x700/?charity'))
#   Charity.create!(
#     name: Faker::Company.name,
#     image: res['location'],
#     description: Faker::Lorem.paragraph,
#     address: Faker::Address.full_address,
#     accepting: true,
#     user: User.all.sample,
#     cause: Cause.all.sample
#   )
# end
# puts "Finished creating charities!"

# CHARITY
charities = [
  {
    name: "Hope for the Children",
    address: "Lagos, Nigeria",
    description: "Focuses on providing education and healthcare to impoverished children in the region.",
    cause: "Children and Youth",
    image: "hope-for-children.png"
  },
  {
    name: "Give a Hand",
    address: "Phnom Penh, Cambodia",
    description: "Works to improve the lives of marginalized communities through education, health, and sanitation programs.",
    cause: "Community Development",
    image: "give-a-hand.png"
  },
  {
    name: "Food for All",
    address: "Dhaka, Bangladesh",
    description: "Provides nutritious meals to families in need throughout the country.",
    cause: "Children and Youth",
    image: "food-for-all.png"
  },
  {
    name: "Safe Haven",
    address: "Nairobi, Kenya",
    description: "Provides shelter and support services for women and children affected by domestic violence.",
    cause: "Children and Youth",
    image: "safe-haven.png"
  },
  {
    name: "Green Earth",
    address: "Lima, Peru",
    description: "Works to promote sustainable agriculture and protect the environment in rural communities.",
    cause: "Enviroment",
    image: "green-earth.png"
  },
  {
    name: "Health for All",
    address: "New Delhi, India",
    description: "Provides healthcare services to underserved populations, with a focus on maternal and child health.",
    cause: "Health",
    image: "health-for-all.png"
  },
  {
    name: "Habitat for Humanity",
    address: "Guatemala City, Guatemala",
    description: "Builds safe and affordable housing for families in need, and works to promote community development.",
    cause: "Community Development",
    image: "habitat-for-humanity.png"
  },
  {
    name: "Wings of Hope",
    address: "Kampala, Uganda",
    description: "Provides education and vocational training to young women, with a focus on empowering them to become leaders in their communities.",
    cause: "Women's Empowerment",
    image: "wings-of-hope.png"
  },
  {
    name: "Empowerment Through Education",
    address: "Lahore, Pakistan",
    description: "Supports girls' education and literacy through school-based programs and community outreach.",
    cause: "Education",
    image: "empowerment-through-education.png"
  },
  {
    name: "Food Bank",
    address: "Manila, Philippines",
    description: "Collects and distributes surplus food to those in need, and works to address food insecurity in the country.",
    cause: "Children and Youth",
    image: "food-bank.png"
  },
  {
    name: "Water for Life",
    address: "Kathmandu, Nepal",
    description: "Works to improve access to safe water and sanitation in rural communities, with a focus on promoting hygiene and preventing disease.",
    cause: "Health",
    image: "water-for-life.png"
  },
  {
    name: "Hands Across Borders",
    address: "Caracas, Venezuela",
    description: "Provides humanitarian assistance and support to refugees and migrants, and works to promote human rights and social justice.",
    cause: "Community Development",
    image: "hand-across-borders.png"
  },
  {
    name: "Community Development",
    address: "Dakar, Senegal",
    description: "Works to improve living conditions and economic opportunities in urban and rural communities, through infrastructure development and training programs.",
    cause: "Community Development",
    image: "community-development.png"
  },
  {
    name: "Bridge of Hope",
    address: "Kigali, Rwanda",
    description: "Works to provide education and healthcare services to children affected by HIV/AIDS, and supports community-based initiatives to promote social inclusion.",
    cause: "Health",
    image: "bridge-of-hope.png"
  },
  {
    name: "Animal Welfare Association",
    address: "Lahore, Pakistan",
    description: "Animal Welfare Association is an organization in Pakistan that works to promote the welfare and rights of animals, including pets. They provide veterinary care, food, and shelter to animals in need, and also work to raise awareness about animal welfare issues.",
    cause: "Animal Welfare",
    image: "animal-welfare-association.png"
  },
  {
    name: "Society for the Prevention of Cruelty to Animals",
    address: "Mumbai, India",
    description: "The Society for the Prevention of Cruelty to Animals is an animal welfare organization in India that works to protect and care for animals, including pets. They rescue and rehabilitate injured and sick animals, and also work to educate the public about animal welfare issues.",
    cause: "Animal Welfare",
    image: "prevention-of-cruelty-to-animals.png"
  },
  {
    name: "African Wildlife Foundation",
    address: "Nairobi, Kenya",
    description: "The African Wildlife Foundation is an organization in Kenya that works to protect and conserve wildlife in Africa, including endangered species. They also work to promote sustainable development in local communities and educate the public about conservation issues.",
    cause: "Animal Welfare",
    image: "african-wildlife-foundation.png"
  }
]

p charities.length

puts "Cleaning database for charities..."
Charity.destroy_all

puts "Creating charities..."

charities.each_with_index do |charity, i|
  puts i
  new = Charity.new(
    name: charity[:name],
    address: charity[:address],
    description: charity[:description],
    accepting: true,
    user: User.all.sample,
    cause: Cause.find_by_name(charity[:cause])
  )

  # image with cloudinary
  file = File.open(Rails.root.join("app/assets/images/#{charity[:image]}"))
  puts "fail" if file == nil
  new.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  new.save
  puts i
end
puts "---------------------"
puts Charity.all.count
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
