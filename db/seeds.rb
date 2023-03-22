require 'faker'
require 'json'
require 'net/http'
require 'uri'

# USER
puts "Cleaning database for users..."
User.destroy_all

# CAUSE
puts "Cleaning database for causes...."
Cause.destroy_all

# CHARITY
puts "Cleaning database for charities..."
Charity.destroy_all

# DONATION
puts "Cleaning database for donations..."
Donation.destroy_all

puts "-" * 50

require_relative 'user_seeds'
require_relative 'cause_seeds'
require_relative 'charity_seeds'
require_relative 'donation_seeds'

puts "↓_↓_↓_↓_↓_↓_↓_↓_↓_↓_↓_↓_↓_↓_↓_↓_↓_↓_↓"
puts "All seeds got successfully created!!!"
