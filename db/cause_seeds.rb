# Cause seed partial
puts "Creating causes..."
Cause.create!(name: "Animal Welfare")
Cause.create!(name: "Children and Youth")
Cause.create!(name: "Community Development")
Cause.create!(name: "Education")
Cause.create!(name: "Health")
Cause.create!(name: "Women's Empowerment")
Cause.create!(name: "Enviroment")

puts "Finished creating #{Cause.count} causes!"
