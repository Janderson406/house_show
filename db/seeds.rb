require 'faker'


 6.times do  #HOST
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    phone: Faker::PhoneNumber.phone_number,
    avatar: Faker::Avatar.image,
    role: "host"
  )
  Address.create!(
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: "59999",
    user: user
  )
  Profile.create!(
    bio: Faker::Lorem.paragraph(7),
    link: Faker::Internet.url,
    user: user
  )
  user.save!
end

6.times do  #ARTIST
 user = User.create!(
   first_name: Faker::Name.first_name,
   last_name: Faker::Name.last_name,
   email: Faker::Internet.email,
   password: Faker::Internet.password(8),
   phone: Faker::PhoneNumber.phone_number,
   avatar: Faker::Avatar.image,
   role: "artist"
 )
 Address.create!(
   street: Faker::Address.street_address,
   city: Faker::Address.city,
   state: Faker::Address.state_abbr,
   zip: "59999",
   user: user
 )
 Profile.create!(
   bio: Faker::Lorem.paragraph(7),
   link: Faker::Internet.url,
   user: user
 )
 user.save!
end

  users = User.all
  profiles = Profile.all

    profiles.each do |photo|
      3.times do
        photo = Photo.create!(
          description: Faker::Hipster.word,
          image: Faker::Placeholdit.image,
          profile: profiles.sample
        )
      end
    end

############################
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
    description: Faker::Lorem.paragraph(5),
    date: Faker::Time.between(DateTime.now - 1, DateTime.now),
    category: categories.sample,
    ticket_link: Faker::Internet.url,
    user: users.sample
  )
end


puts "Seeding Finished"
puts "#{User.count} users created"
puts "#{Category.count} categories created"
puts "#{Event.count} events created"
