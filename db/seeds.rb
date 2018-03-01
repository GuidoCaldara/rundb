puts "///   Deleting all orders"
Order.destroy_all
puts "///   Deleting all favorites"
Favorite.destroy_all
puts "///   Deleting all reviews"
Review.destroy_all
puts "///   Deleting all route data"
Route.destroy_all
puts "///   Deleting all races"
Race.destroy_all
puts "///   Deleting all organizations"
Organisation.destroy_all
puts "///   Deleting all users"
User.destroy_all

# CREATING USERS

puts "///   Creating users"
30.times do
  user = User.new(
    email: Faker::Internet.free_email,
    password: Faker::Internet.password(8),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name)

  if user.save
    puts user.first_name + " " + user.last_name + " created!"
  end
end

puts "///   #{User.count} users in the database!"

# CREATING ORGANISATION

puts "///   Creating organisations"
10.times do
  organisation = Organisation.new(
    user_id: User.all.sample.id,
    name: Faker::SiliconValley.company)
  if organisation.save
    puts organisation.name + " " + " created!"
  end
end

puts "///   #{Organisation.count} organisations in the database!"

# CREATING RACES

category = ["trail", "road", "vertical", "skyrace"]
location = ["Milan, italy",
"Naples, italy",
"Turin, italy",
"Palermo, italy",
"Genoa, italy",
"Bologna, italy",
"Florence, italy",
"Bari, italy",
"Catania, italy",
"Venice, italy",
"Verona, italy",
"Messina, italy",
"Padua, italy",
"Trieste, italy",
"Taranto, italy",
"Brescia, italy",
"Parma, italy",
"Prato, italy",
"Modena, italy",
"Reggio Calabria, italy",
"Reggio Emilia, italy",
"Perugia, italy",
"Ravenna, italy",
"Livorno, italy",
"Cagliari, italy",
"Foggia, italy",
"Rimini, italy",
"Salerno, italy",
"Ferrara, italy",
"Sassari, italy",
"Latina, italy",
"Giugliano in Campania, italy",
"Monza, italy",
"Syracuse, italy",
"Pescara, italy",
"Bergamo, italy",
"Forlì, italy",
"Trento, italy",
"Vicenza, italy",
"Terni, italy",
"Bolzano, italy",
"Novara, italy",
"Piacenza, italy",
"Ancona, italy",
"Andria, italy",
"Arezzo, italy",
"Udine, italy",
"Cesena, italy",
"Lecce, italy",
"Pesaro, italy",
"Barletta, italy",
"Alessandria, italy",
"La Spezia, italy",
"Pisa, italy",
"Catanzaro, italy",
"Pistoia, italy",
"Guidonia Montecelio, italy",
"Lucca, italy",
"Brindisi, italy",
"Torre del Greco, italy",
"Como, italy",
"Treviso, italy",
"Busto Arsizio, italy",
"Marsala, italy",
"Grosseto, italy",
"Sesto San Giovanni, italy",
"Pozzuoli, italy",
"Varese, italy",
"Fiumicino, italy",
"Casoria, italy",
"Asti, italy",
"Caserta, italy",
"Cinisello Balsamo, italy",
"Gela, italy",
"Aprilia, italy",
"Ragusa, italy",
"Pavia, italy",
"Cremona, italy",
"Carpi, italy",
"Quartu Sant'Elena, italy",
"Lamezia Terme, italy",
"Altamura, italy",
"Imola, italy",
"L’Aquila, italy",
"Massa, italy",
"Trapani, italy",
"Cosenza, italy",
"Viterbo, italy",
"Potenza, italy",
"Castellammare di Stabia, italy",
"Afragola, italy",
"Vittoria, italy",
"Vigevano, italy",
"Crotone, italy",
"Pomezia, italy",
"Caltanissetta, italy",
"Carrara, italy",
"Viareggio, italy",
"Savona, italy",
"Fano, italy",
"Matera, italy",
"Legnano, italy",
"Olbia, italy",
"Benevento, italy",
"Marano di Napoli, italy",
"Acerra, italy",
"Molfetta, italy",
"Agrigento, italy",
"Faenza, italy",
"Cerignola, italy",
"Moncalieri, italy",
"Foligno, italy",
"Manfredonia, italy",
"Tivoli, italy",
"Cuneo, italy",
"Trani, italy",
"Bisceglie, italy",
"Bagheria, italy",
"Bitonto, italy",
"Portici, italy",
"Sanremo, italy",
"Teramo, italy",
"Avellino, italy",
"Modica, italy",
"Anzio, italy",
"Montesilvano, italy",
"Siena, italy",
"Cava de' Tirreni, italy",
"San Severo, italy",
"Velletri, italy",
"Ercolano, italy",
"Gallarate, italy",
"Aversa, italy",
"Civitavecchia, italy",
"Acireale, italy",
"Rovigo, italy",
"Mazara del Vallo, italy",
"Chieti, italy",
"Pordenone, italy",
"Battipaglia, italy",
"Scafati, italy",
"Rho, italy",
"Scandicci, italy"]

puts "///   Creating races"
100.times do
  race = Race.new(
    name: "Race #{Faker::Hipster.word.capitalize}",
    distance: rand(1..5)*10,
    elevation: rand(100..2000),
    date: Date.today + (rand(1..200)).days,
    category: category.sample,
    location: location.sample,
    fee: rand(10..50),
    organisation_id: Organisation.all.sample.id)
  if race.save
    puts race.name + " " + " created!"
  end
end

puts "///   #{Race.count} races in the database!"





