puts "///   Creating users"
15.times do
  user = User.new(
    email: Faker::Internet.free_email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    remote_avatar_url: "http://res.cloudinary.com/guidocld/image/upload/v1520479304/user#{rand(1..6)}.jpg",

    )


  if user.save
    puts user.first_name + " " + user.last_name + " created!"
  end
end

orgloc = ["Milan, italy",
  "Naples, italy",
  "Turin, italy",
  "Palermo, italy",
  "Bergamo, italy",
  "Clusone, italy",
  "Florence, italy",
  "Bari, italy",
  "Brescia, italy",
  "Venice, italy",
  "Verona, italy",
  "Albino, italy",
  "Padua, italy",
  "Trieste, italy",
  "Taranto, italy",
  "Brescia, italy",
  "Treviglio, italy",
  "Prato, italy",
  "Modena, italy",
  "Reggio Emilia, italy",
  "Perugia, italy",
  "Ravenna, italy",
  "Livorno, italy",
  "Cagliari, italy",
  "Foggia, italy",
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

  puts "///   Creating organisations"
  10.times do
    organisation = Organisation.new(
      user_id: User.all.sample.id,

      name: Faker::SiliconValley.company,
      address: orgloc.sample,
      email: "Faker::Internet.free_email",
      description: "We are a group of running lovers and we  organize amazing races around the world! Skyrace, road race and trail running race for all the runner",
      remote_logo_url: "http://res.cloudinary.com/guidocld/image/upload/v1520479304/logo#{rand(1..4)}.jpg"
      )
    if organisation.save
      puts organisation.name + " " + " created!"
    end
  end

  bookable = [true, true, false]
  category = ["trail", "road", "vertical", "skyrace"]
  location = ["Milan, italy",
    "Naples, italy",
    "Turin, italy",
    "Palermo, italy",
    "Bergamo, italy",
    "Clusone, italy",
    "Florence, italy",
    "Bari, italy",
    "Brescia, italy",
    "Venice, italy",
    "Verona, italy",
    "Albino, italy",
    "Padua, italy",
    "Trieste, italy",
    "Taranto, italy",
    "Brescia, italy",
    "Treviglio, italy",
    "Prato, italy",
    "Modena, italy",
    "Reggio Emilia, italy",
    "Perugia, italy",
    "Ravenna, italy",
    "Livorno, italy",
    "Cagliari, italy",
    "Foggia, italy",
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
    10.times do
      race = Race.new(
        name: "Race #{Faker::Hipster.word.capitalize}",
        race_distance: rand(1..15)*10,
        elevation: rand(100..3000),
        date: (Date.today + (rand(155..200)).days),
        date_stamp: ((Date.today + (rand(1..200)).days).to_time.to_i * 1000),
        category: category.sample,
        location: location.sample,
        fee_cents: rand(50..100),
        description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum inventore hic doloremque, sint voluptas sit molestiae quod odit, et atque ipsum aliquam odio debitis blanditiis enim. Vitae, officiis, quam! Doloribus odit animi eum aliquam amet minima, harum repellat pariatur cumque labore, nostrum modi, dicta eligendi praesentium perferendis dignissimos nam. Atque!",
        discount_fee_cents: rand(30..40),
        capacity: rand(100...400),
        bookable: true,
        discount_fee_finish: (Date.today + (rand(55..85)).days),
        subscription_start: (Date.today + (rand(1..49)).days),
        subscription_end: (Date.today + (rand(60..149)).days),
        organisation_id: Organisation.all.sample.id,
        first_edition: (Date.today - (rand(1..20)).years),
        starting_time: Date.today,
        website: "www.amazingrace.it",
        subscription_link: "www.amazingrace.it/subscription",
        starting_point: "Colossemum",
        goodies: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab possimus vel, temporibus distinctio magnam, maiores cum unde tempore illum tempora deleniti.",
        video: "https://www.youtube.com/watch?v=gF0rrpMH-Jo"

        )

      race.save
      if race.latitude && race.longitude
        race._geoloc = {"lat" => race.latitude, "lng" => race.longitude}
        race.save
      else
        race._geoloc = {"lat" => 41.2027767, "lng" => 16.5987187}
        race.save
      end
      if race.bookable
       race.subscription_link = nil
       race.save
     end
     puts race.name + " " + " created!"
   end


   puts "///   #{Race.count} races in the database!"


   puts "creating maga skyrace"

   user = User.new(
    email: "magaskyrace@gmail.com",
    password: "password",
    first_name: "Davide",
    last_name: "Scolari")


   if user.save
    puts user.first_name + " " + user.last_name + " created!"
  end

  puts "///   Creating organisations"
  organisation = Organisation.new(
    user_id: User.last.id,

    name: "Maga Sky Marathon" ,
    address: "Oltre il colle",
    email: "magaskyrace@gmail.com",
    description: "We are a group of running lovers and we  organize amazing races around the world! Skyrace, road race and trail running race for all the runner We are a group of running lovers and we  organize amazing races around the world! Skyrace, road race and trail running race for all the runner. ")
  if organisation.save
    puts organisation.name + " " + " created!"
  end


  puts "///   Creating teh Maga Race"
  race = Race.new(
    name: "Maga Skymarathon",
    race_distance: 40,
    elevation: 3000,
    date: Date.today + 200.days,
    date_stamp: ((Date.today + 200.days).to_time.to_i * 1000),
    category: "skyrace",
    location: "Oltre il Colle",
    fee_cents: 50,
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum inventore hic doloremque, sint voluptas sit molestiae quod odit, et atque ipsum aliquam odio debitis blanditiis enim. Vitae, officiis, quam! Doloribus odit animi eum aliquam amet minima, harum repellat pariatur cumque labore, nostrum modi, dicta eligendi praesentium perferendis dignissimos nam. Atque!",
    discount_fee_cents: 40,
    capacity: 300,
    bookable: true,
    discount_fee_finish: (Date.today + 100.days),
    subscription_start: Date.today,
    subscription_end: (Date.today + 180.days),
    organisation_id: Organisation.last.id,
    first_edition: (Date.today - 10.years),
    starting_time: Date.today,
    website: "http://www.magaskymarathon.it/",
    starting_point: "Serina, Palazzetto dello sport",
    goodies: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab possimus vel, temporibus distinctio magnam, maiores cum unde tempore illum tempora deleniti.",
    video: "https://www.youtube.com/watch?v=wbLvK4DCA6Y"

    )
  race.save
  if race.latitude && race.longitude
    race._geoloc = {"lat" => race.latitude, "lng" => race.longitude}
    race.save
  else
    race._geoloc = {"lat" => 41.2027767, "lng" => 16.5987187}
    race.save
  end
  if race.bookable
   race.subscription_link = nil
   race.save
 end
 puts race.name + " " + " created!"



 puts "///   #{Race.count} races in the database!"


 puts "///   Creating orders"

 Race.all.each do |race|
  x = rand (10..27)
  x.times do
    order = Order.new
    order.race_id = race.id
    order.user_id = User.all.sample.id
    order.state = "paid"
    if order.save
      puts "1 order just created for #{race.name}"
    else
      puts "!!! order not save"
    end
  end
end
puts "///  #{Order.count} order created!"


# # CREATING REVIEWS
puts "///   Creating reviews"

Order.all.each do |order|
  review = Review.new
  review.race_id = order.race_id
  review.user_id = order.user_id
  review.description = Faker::Lorem.sentence(60, true, 20)
  review.route_rate = rand(1..10)
  review.organisation_rate = rand(1..10)
  review.value_for_money = rand(1..10)
  review.save
  puts "1 review created for race #{Race.find(order.race_id).name}"
end
puts "///   #{Review.count} reviews created!"


## REINDEX ALGOLIA


## CREATING ROUTE MAP

puts "///   Creating route map"

Race.pop.all.each do |race|
  route = Route.new(
    pathfile: [[-8.646154, 115.134085],
    [-8.646144, 115.133982],
    [-8.646159, 115.133877],
    [-8.646198, 115.133781],
    [-8.646256, 115.133701],
    [-8.663, 115.133617],
    [-8.646368, 115.133536],
    [-8.64643, 115.133439]])

  route.race_id = race.id
  route.save
end


