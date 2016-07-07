require 'faker'


2.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    phone: Faker::PhoneNumber.phone_number,
    avatar: Faker::Avatar.image

  )
  user.save!
end

users = User.all

5.times do
  Category.create!(
    name: Faker::Hipster.word,
    #user: users.sample
  )
end

categories = Category.all

10.times do
  Event.create!(
    title: Faker::Book.title,
    description: Faker::Hacker.say_something_smart,
    date: Faker::Time.between(DateTime.now - 1, DateTime.now),
    category: categories.sample,
    ticket_link: Faker::Internet.url
  )
end


puts "Seeding Finished"
puts "#{User.count} users created"
puts "#{Category.count} items created"
puts "#{Event.count} items created"
