require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

duration_array = [5, 20, 30, 45, 60, 80, 120]

10.times do
  fname = Faker::Name.first_name
  lname = Faker::Name.last_name
  User.create(first_name: fname, last_name: lname, description: Faker::Lorem.sentence(word_count: 10), email: "#{fname}.#{lname}@yopmail.com" )
end
puts "10 Users créés"

10.times do
  Event.create(owner: User.all.sample, title: Faker::Lorem.sentence(word_count: 5), description: Faker::Lorem.sentence(word_count: 15), start_date: Faker::Date.between(from: '2020-11-03', to: '2020-11-30'), duration: duration_array.sample, price: Faker::Number.within(range: 1..1000), location: Faker::Restaurant.name)
end
puts "10 Events créés"

30.times do
  Attendance.create(guest: User.all.sample, event: Event.all.sample, stripe_customer_id: " " )
end
puts "30 Attendances créés"
