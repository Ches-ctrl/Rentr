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

puts "Creating 4 users... pull up your socks!"

User.create(email: "email1@gmail.com", password: "password", first_name: "Charlotte", last_name: "the genius", license_number: "QUEEN1")
puts "Created user:  #{User.first.first_name}"
User.create(email: "email2@gmail.com", password: "password", first_name: "Ilya", last_name: "the russian hacker", license_number: "HN18TKK")
puts "Created user:  #{User.second.first_name}"
User.create(email: "email3@gmail.com", password: "password", first_name: "Direncan", last_name: "the worst webdev", license_number: "KP66FH0")
puts "Created user:  #{User.third.first_name}"
User.create(email: "email4@gmail.com", password: "password", first_name: "Charlie", last_name: "mr robot", license_number: "LL77FGN")
puts "Created user:  #{User.fourth.first_name}"

puts "Created 4 Super Users"

# puts User.all

# 12.times do
#   car = Car.new(
#     category: Faker::Vehicle.car_type,
#     model: Faker::Vehicle.model,
#     brand: Faker::Vehicle.make,
#     location: Faker::Address.city,
#     transmission: Faker::Vehicle.transmission,
#     day_rate: Faker::Number.decimal(l_digits: 2),
#     description: Faker::Vehicle.standard_specs,
#     user_id: User.all.sample.id



  # if car.save
  #   puts "Saved your car"
  #   3.times do |i|
  #     # Open, attach, and close the file within the block to ensure it's closed immediately after use
  #     File.open("app/assets/images/car-photo-#{rand(1..12)}.png") do |file|
  #       car.photos.attach(io: file, filename: "car-photo-#{i}.png", content_type: "image/png")
  #       puts "Added an image"
  #     end
  #   end

  #   # Attach the last image separately and close the file immediately after
  #   File.open("app/assets/images/flintstone.png") do |file|
  #     car.photos.attach(io: file, filename: "flintstones.png", content_type: "image/png")
  #     puts "Added an image"
  #   end
  # else
  #   puts "Failed to create a car: #{car.errors.full_messages.join(", ")}"
  # end

#   puts "Created a car"


# puts Car.all

# puts "Finished!"

# TODO: Seed Bookings

# ... (User creation code remains the same)

# Define the Car class
# class Car
#   attr_accessor :brand, :model, :transmission, :location, :day_rate, :photos

#   def initialize(brand, model, transmission, location, day_rate, photos)
#     @brand = brand
#     @model = model
#     @transmission = transmission
#     @location = location
#     @day_rate = day_rate
#     @photos = photos
#   end
# end






puts "Aaawsome cars loading... tighten your seatbelts! "
# Define genuine electric car data
car_1 = Car.new(brand: "Tesla", model: "Model S", transmission: "Automatic", location: "Hoxton", day_rate: 300, description: "The Tesla Model S is an all-electric five-door liftback sedan produced by Tesla, Inc., and was introduced on June 22, 2012. As of April 23, 2019, the Model S Long Range has an EPA range of 370 miles (600 km), higher than any other electric car. The EPA rated the 2017 90D Model S's energy consumption at 200.9 watt-hours per kilometer (32.33 kWh/100 mi or 20.09 kWh/100 km) for a combined fuel economy of 104 miles per gallon gasoline equivalent (2.26 L/100 km or 125 mpg")

car_2 = Car.new(brand: "Porsche", model: "Taycan", transmission: 'Automatic', location: 'Shoreditch', day_rate: 400, description: "The Porsche Taycan is an all-electric car made by German automobile manufacturer Porsche, It is Porsche's first series production electric car, and is marketed as being 'lifestyle-compatible', as it is designed to fit into everyday life as well as being used in a sporting manner. The Taycan is the first production vehicle with a system voltage of 800 volts instead of the usual 400 volts for electric cars. This allows for thinner cables to save weight, and the ability to charge the car at a higher rate than other electric cars. The Taycan is also the first production car to use a two-speed transmission, which allows for better acceleration and efficiency at high speeds.")

car_3 = Car.new(brand: "Audi", model: "e-tron GT", transmission: "Automatic", location: "Croydon", day_rate: 320, description: "The Audi e-tron GT is an all-electric grand tourer produced by Audi. It is the third model of the Audi e-tron range, after the Audi e-tron and the Audi e-tron Sportback. The e-tron GT is manufactured by Audi Sport GmbH in Neckarsulm, Germany. The e-tron GT shares its platform with the Porsche Taycan. The e-tron GT quattro  is powered by a 93.4 kWh lithium-ion battery pack and two electric motors, one on each axle. The front motor produces 175 kW (235 hp; 238 PS) and 350 N⋅m (258 lb⋅ft) of torque, while the rear motor produces 320 kW (429 hp; 435 PS) and 640 N⋅m (472 lb⋅ft) of torque. The RS e-tron GT has a range of 232 miles (373 km).")

car_4 = Car.new(brand: "Rimac", model: "C Two", transmission: "Automatic", location: "Sevenoaks", day_rate: 250, description: "The Rimac C Two (stylized as C_Two) is a semi-autonomous all-electric sports car designed and manufactured by the Croatian automotive manufacturer Rimac Automobili.This is the automaker's second car after the Rimac Concept One, which was released in 2013. The C Two is powered by a 120 kWh lithium manganese nickel battery pack that delivers 1.4 MW (1,914 PS; 1,888 hp) of power and 2,300 N⋅m (1,696 lb⋅ft) of torque. The C Two has a claimed top speed of 258 mph (415 km/h) and can accelerate from 0–60 mph (0–97 km/h) in 1.85 seconds, 0–100 mph (0–161 km/h) in 4.3 seconds, and 0–186 mph (0–300 km/h) in 11.8 seconds.")

car_5 = Car.new(brand: "Tesla", model: "CyberTruck", transmission: "Automatic", location: "Mayfair", day_rate: 250, description: "The Tesla Cybertruck is an all-electric, battery-powered, light duty truck announced by Tesla, Inc. Three models have been announced, with EPA range estimates of 250–500 miles (400–800 km) and an estimated 0–60 mph time of 2.9–6.5 seconds,The stated goal of Tesla in developing Cybertruck is to provide a sustainable energy substitute for the roughly 6,500 fossil fuel-powered trucks sold per day in the United States. The Cybertruck is built with an exterior shell made for ultimate durability and passenger protection. Starting with a nearly impenetrable exoskeleton, every component is designed for superior strength and endurance, from Ultra-Hard 30X Cold-Rolled stainless-steel structural skin to Tesla armor glass.")


car_6 = Car.new(brand: "Tesla", model: "Model 3", transmission: "Automatic", location: "Fulham", day_rate: 250, description: "The Tesla Model 3 is an electric four-door fastback sedan developed by Tesla. The Model 3 Standard Range Plus version delivers an EPA-rated all-electric range of 263 miles (423 km) and the Long Range versions deliver 353 miles (568 km). The Model 3 carries full self-driving hardware, with periodic software updates adding functionality. As of August 2021, Tesla operates 598 stores and galleries in 32 countries. Tesla's global vehicle sales were 499,550 units in 2020, a 35.8% increase over the previous year. In 2020, the company surpassed the 1 million mark of electric cars produced.")

car_7 = Car.new(brand: "Tesla", model: "Model X", transmission: "Automatic", location: "Shadwell", day_rate: 280, description: "The Tesla Model X is a mid-size all-electric luxury crossover made by Tesla, Inc. The vehicle is notable in that it uses falcon-wing doors for passenger access. The Model X has an official EPA rated 250–325 mi (402–523 km) range and the combined fuel economy equivalent and energy consumption for the AWD P90D was rated at 89 mpg‑e (39 kW⋅h/100 mi). The EPA rated the 2017 90D Model X's energy consumption at 102 miles per gallon gasoline equivalent (2.3 L/100 km or 122 mpg‑imp), for a combined fuel economy of 93 miles per gallon gasoline equivalent (2.5 L/100 km or 112 mpg‑imp).")


car_8 = Car.new(brand: "Audi", model: "Q8 e-tron", transmission: "Automatic", location: "Southgate", day_rate: 320, description: "The Audi Q8 is a mid-size luxury crossover SUV coupé made by Audi that was launched in 2018. It is the flagship of the Audi SUV line. The Q8 is powered by a 3.0-litre turbocharged V6 petrol engine with a 48-volt mild hybrid system. The engine produces 340 PS (250 kW; 335 hp) and 500 N⋅m (369 lb⋅ft) of torque. The Q8 has a claimed fuel economy of 9.1 L/100 km (31 mpg‑imp; 26 mpg‑US). The Q8 is equipped with an eight-speed automatic transmission and quattro permanent all-wheel drive. The Q8 has a claimed 0–100 km/h (0–62 mph) acceleration time of 5.9 seconds and a top speed of 250 km/h (155 mph).")

car_9 = Car.new(brand: "BMW", model: "i4",  transmission: "Automatic", location: "Chelsea", day_rate: 280, description: "The BMW i4 is an all-electric four-door liftback sedan produced by BMW. The i4 is powered by an 80 kWh battery pack and has a claimed range of 590 km (370 mi) under the WLTP cycle. The M50 has two electric motors, one on each axle, that produce a combined 400 kW (536 hp; 544 PS) and 795 N⋅m (586 lb⋅ft) of torque. The M50 has a claimed 0–100 km/h (0–62 mph) acceleration time of 3.9 seconds and a top speed of 225 km/h (140 mph).")

car_10 = Car.new(brand: "BMW", model: "iX", transmission: "Automatic", location: "Bermondsey", day_rate: 250, description: "The BMW iX is an all-electric compact luxury crossover SUV produced by BMW. The iX is powered by a 100 kWh battery pack and has a claimed range of 630 km (390 mi) under the WLTP cycle. The iX xDrive50 has two electric motors, one on each axle, that produce a combined 385 kW (516 hp; 523 PS) and 765 N⋅m (564 lb⋅ft) of torque. The iX xDrive50 has a claimed 0–100 km/h (0–62 mph) acceleration time of 4.6 seconds and a top speed of 200 km/h (124 mph).")

car_11 = Car.new(brand: "Pininfarina", model: "Battista", transmission: "Automatic", location: "Canary Wharf", day_rate: 420, description: "The Pininfarina Battista is an electric sports car produced by the Italian automobile manufacturer Automobili Pininfarina. The Battista is powered by a 120 kWh lithium-ion battery pack and four electric motors, one on each wheel, that produce a combined 1,400 kW (1,877 hp; 1,900 PS) and 2,300 N⋅m (1,696 lb⋅ft) of torque. The Battista has a claimed 0–100 km/h (0–62 mph) acceleration time of less than 2 seconds, 0–300 km/h (0–186 mph) in less than 12 seconds, and a top speed of 350 km/h (217 mph).")

car_12 = Car.new(brand: "Mercedes", model: "EQS", transmission: "Automatic", location: "Wembley", day_rate: 320, description: "The Mercedes-Benz EQS is a full-size luxury electric car produced by Mercedes-Benz. The EQS is powered by a 107.8 kWh lithium-ion battery pack and two electric motors, one on each axle. The front motor produces 167 kW (224 hp; 227 PS) and 370 N⋅m (273 lb⋅ft) of torque, while the rear motor produces 320 kW (429 hp; 435 PS) and 568 N⋅m (419 lb⋅ft) of torque. The EQS has a claimed 0–100 km/h (0–62 mph) acceleration time of 4.3 seconds and a top speed of 210 km/h (130 mph).")

car_13 = Car.new(brand: "Mercedes", model: "EQC", transmission: "Automatic", location: "Lewisham", day_rate: 320, description: "The Mercedes-Benz EQC is a fully-electric compact luxury SUV produced by Mercedes-Benz. The EQC is powered by an 80 kWh lithium-ion battery pack and two electric motors, one on each axle. The front motor produces 150 kW (201 hp; 204 PS) and 300 N⋅m (221 lb⋅ft) of torque, while the rear motor produces 150 kW (201 hp; 204 PS) and 300 N⋅m (221 lb⋅ft) of torque. The EQC has a claimed 0–100 km/h (0–62 mph) acceleration time of 5.1 seconds and a top speed of 180 km/h (112 mph).")

car_14 = Car.new(brand: "Rimac", model: "Nevera", transmission: "Automatic", location: "Brixton", day_rate: 420, description: "The Rimac Nevera (stylized as Nevera) is an all-electric grand tourer produced by Croatian automobile manufacturer Rimac Automobili. The Nevera is powered by a 120 kWh lithium-ion battery pack and four electric motors, one on each wheel. The Nevera has a claimed 0–100 km/h (0–62 mph) acceleration time of 1.85 seconds, 0–300 km/h (0–186 mph) in 9.3 seconds, and a top speed of 412 km/h (256 mph).")

car_15 = Car.new(brand: "Aston Martin", model: "Rapide" , transmission: "Automatic", location: "Hammersmith", day_rate: 320, description: "The Aston Martin Rapide E is an all-electric grand tourer produced by British automobile manufacturer Aston Martin. The Rapide E is powered by a 65 kWh lithium-ion battery pack and two electric motors, one on each axle. The front motor produces 185 kW (248 hp; 252 PS) and 450 N⋅m (332 lb⋅ft) of torque, while the rear motor produces 185 kW (248 hp; 252 PS) and 550 N⋅m (406 lb⋅ft) of torque. The Rapide E has a claimed 0–100 km/h (0–62 mph) acceleration time of 4.0 seconds and a top speed of 250 km/h (155 mph).")

car_16 = Car.new(brand: "NIO", model: "ET7", transmission: "Automatic", location: "Kensington", day_rate: 320, description: "The NIO ET7 is an all-electric executive sedan produced by Chinese automobile manufacturer NIO. The ET7 is powered by a 70 kWh lithium-ion battery pack and two electric motors, one on each axle. The front motor produces 180 kW (241 hp; 244 PS) and 305 N⋅m (225 lb⋅ft) of torque, while the rear motor produces 300 kW (402 hp; 408 PS) and 644 N⋅m (475 lb⋅ft) of torque. The ET7 has a claimed 0–100 km/h (0–62 mph) acceleration time of 3.9 seconds and a top speed of 200 km/h (124 mph).")

car_17 = Car.new(brand: "Deus", model: "Vayanne", transmission: "Automatic", location: "Ealing", day_rate: 430 , description: "The Deus Vayanne is an all-electric executive sedan produced by Chinese automobile manufacturer NIO. The ET7 is powered by a 70 kWh lithium-ion battery pack and two electric motors, one on each axle. The front motor produces 180 kW (241 hp; 244 PS) and 305 N⋅m (225 lb⋅ft) of torque, while the rear motor produces 300 kW (402 hp; 408 PS) and 644 N⋅m (475 lb⋅ft) of torque. The ET7 has a claimed 0–100 km/h (0–62 mph) acceleration time of 3.9 seconds and a top speed of 200 km/h (124 mph).")

car_18 = Car.new(brand: "Drako", model: "GTE" , transmission: "Automatic", location: "Enfield", day_rate: 290, description: "The Drako GTE is an all-electric executive sedan produced by Chinese automobile manufacturer NIO. The ET7 is powered by a 70 kWh lithium-ion battery pack and two electric motors, one on each axle. The front motor produces 180 kW (241 hp; 244 PS) and 305 N⋅m (225 lb⋅ft) of torque, while the rear motor produces 300 kW (402 hp; 408 PS) and 644 N⋅m (475 lb⋅ft) of torque. The ET7 has a claimed 0–100 km/h (0–62 mph) acceleration time of 3.9 seconds and a top speed of 200 km/h (124 mph).")

car_19 = Car.new(brand: "NIO", model:"EP9", transmission: "Automatic", location: "Battersea", day_rate: 320, description: "The NIO EP9 is an all-electric executive sedan produced by Chinese automobile manufacturer NIO. The ET7 is powered by a 70 kWh lithium-ion battery pack and two electric motors, one on each axle. The front motor produces 180 kW (241 hp; 244 PS) and 305 N⋅m (225 lb⋅ft) of torque, while the rear motor produces 300 kW (402 hp; 408 PS) and 644 N⋅m (475 lb⋅ft) of torque. The ET7 has a claimed 0–100 km/h (0–62 mph) acceleration time of 3.9 seconds and a top speed of 200 km/h (124 mph).")

car_20 = Car.new(brand: "Lamborghini", model: "Terzo" , transmission: "Automatic", location: "Hampstead", day_rate: 460, description: "The Lamborghini Terzo Millennio is an all-electric executive sedan produced by Chinese automobile manufacturer NIO. The ET7 is powered by a 70 kWh lithium-ion battery pack and two electric motors, one on each axle. The front motor produces 180 kW (241 hp; 244 PS) and 305 N⋅m (225 lb⋅ft) of torque, while the rear motor produces 300 kW (402 hp; 408 PS) and 644 N⋅m (475 lb⋅ft) of torque. The ET7 has a claimed 0–100 km/h (0–62 mph) acceleration time of 3.9 seconds and a top speed of 200 km/h (124 mph).")


cars = [car_1, car_2, car_3, car_4, car_5, car_6, car_7, car_8, car_9, car_10, car_11, car_12, car_13, car_14, car_15, car_16, car_17, car_18, car_19, car_20]
car_photos = [["tesla_modelS_1.png","tesla_modelS_2.png","tesla_modelS_3.png","tesla_modelS_4.png"], ["porsche_taycan_1.png", "porsche_taycan_2.png","porsche_taycan_3.png","porsche_taycan_4.png"], ["audi_etron_1.png","audi_etron_2.png","audi_etron_3.png","audi_etron_4.png"], ["rimac_ctwo_1.png","rimac_ctwo_2.png", "rimac_ctwo_3.png", "rimac_ctwo_4.png"], ["tesla_cybertruck_1.png", "tesla_cybertruck_2.png","tesla_cybertruck_3.png", "tesla_cybertruck_4.png"], ["tesla_model3_1.png", "tesla_model3_2.png", "tesla_model3_3.png", "tesla_model3_4.png"], ["tesla_modelx_1.png", "tesla_modelx_2.png","tesla_modelx_3.png","tesla_modelx_4.png"], ["audi_q8etron_1.png","audi_q8etron_2.png", "audi_q8etron_3.png", "audi_q8etron_4.png"], ["bmw_i4_1.png","bmw_i4_2.png","bmw_i4_3.png","bmw_i4_4.png"], ["bmw_ix_1.png","bmw_ix_2.png","bmw_ix_3.png","bmw_ix_4.png"],["pininfarina_1.png","pininfarina_2.png","pininfarina_3.png","pininfarina_4.png"], ["mercedes_eqs_1.png","mercedes_eqs_2.png","mercedes_eqs_3.png","mercedes_eqs_4.png"], ["mercedes_eqc_1.png","mercedes_eqc_2.png","mercedes_eqc_3.png","mercedes_eqc_4.png"], ["rimac_nevera_1.png","rimac_nevera_2.png","rimac_nevera_3.png","rimac_nevera_4.png"], ["astonmartin_rapide_1.png","astonmartin_rapide_2.png","astonmartin_rapide_3.png","astonmartin_rapide_4.png"], ["nio_et7_1.png","nio_et7_2.png","nio_et7_3.png","nio_et7_4.png"], ["deus_vayanne_1.png", "deus_vayanne_2.png","deus_vayanne_3.png","deus_vayanne_4.png"], ["drako_gte_1.png","drako_gte_2.png","drako_gte_3.png","drako_gte_4.png"], ["nio_ep9_1.png","nio_ep9_2.png","nio_ep9_3.png","nio_ep9_4.png"], ["lamborghini_terzo_1.png","lamborghini_terzo_2.png","lamborghini_terzo_3.png","lamborghini_terzo_4.png"]]



cars.each_with_index do |car, i|
  car_photos[i].each do |photo|
    file = File.open("app/assets/images/cars/#{photo}")
    car.photos.attach(io: file, filename: photo, content_type: "image/png")
    puts "Photo attached"
  end
  car.user = User.all.sample
  car.save!
  puts "Car created"
end

puts "all done! wheres my keys at?"
