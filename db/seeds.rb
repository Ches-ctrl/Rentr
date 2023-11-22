# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# TODO: Destroy Bookings

Car.destroy_all
User.destroy_all

puts "Seeding database with users and cars"

puts "Creating 4 users..."

User.create(email: "email1@gmail.com", password: "password", first_name: "John", last_name: "Doe", license_number: "QUEEN1")
puts "Created user:  #{User.first.first_name}"
User.create(email: "email2@gmail.com", password: "password", first_name: "Jane", last_name: "Dobbs", license_number: "HN18TKK")
puts "Created user:  #{User.second.first_name}"
User.create(email: "email3@gmail.com", password: "password", first_name: "Direncan", last_name: "Direncan", license_number: "KP66FH0")
puts "Created user:  #{User.third.first_name}"
User.create(email: "email4@gmail.com", password: "password", first_name: "Joe", last_name: "Bloggs", license_number: "LL77FGN")
puts "Created user:  #{User.fourth.first_name}"

puts "Created 4 Users"

puts User.all

12.times do
  car = Car.new(
    category: Faker::Vehicle.car_type,
    model: Faker::Vehicle.model,
    brand: Faker::Vehicle.make,
    location: Faker::Address.city,
    transmission: Faker::Vehicle.transmission,
    day_rate: Faker::Number.decimal(l_digits: 2),
    description: Faker::Vehicle.standard_specs,
    user_id: User.all.sample.id

  )

  if car.save
    puts "Saved your car"
    3.times do |i|
      # Open, attach, and close the file within the block to ensure it's closed immediately after use
      File.open("app/assets/images/car-photo-#{rand(1..10)}.png") do |file|
        car.photos.attach(io: file, filename: "car-photo-#{i}.png", content_type: "image/png")
        puts "Added an image"
      end
    end

    # Attach the last image separately and close the file immediately after
    File.open("app/assets/images/flintstone.png") do |file|
      car.photos.attach(io: file, filename: "flintstones.png", content_type: "image/png")
      puts "Added an image"
    end
  else
    puts "Failed to create a car: #{car.errors.full_messages.join(", ")}"
  end

  puts "Created a car"
end

puts Car.all

puts "Finished!"

# TODO: Seed Bookings
