# User seed partial
puts "Creating users..."
10.times do
  User.create!(
    email: Faker::Internet.email,
    name: Faker::Name.name,
    password: "123456"
  )
end

puts "Finished creating #{User.count} users!"
