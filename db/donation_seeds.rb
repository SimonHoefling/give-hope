# Donation seed partial
puts "Creating donations..."
200.times do
  started = Date.today - rand(365)
  ended = started + rand(365)
  Donation.create!(
    donations_amount: rand(1..100),
    started: started,
    ended: ended,
    user: User.all.sample,
    charity: Charity.all.sample
  )
end

puts "Finished creating #{Donation.count} donations!"
puts "---"
