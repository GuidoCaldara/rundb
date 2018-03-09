

Order.where(race_id: 109).destroy_all

50.times do
  order = Order.new
  order.race_id = 109
  order.user_id = 56
  order.first_name = "Clement"
  order.last_name = "Bonnemaire"
  order.group = "Singa Run"
  order.gender = "male"
  order.city = "Singapore"
  order.state = "paid"
  order.date_of_birth = Date.today
  order.save
end
