# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Chaque bloc vide une db et créé 20 entrées générées aléatoirement, à l'exception de Specialty qui est prédeterminé.

require 'faker'

City.destroy_all
i=1
20.times do
  city = City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
  puts "City n°#{i} created"
  i += 1
end

User.destroy_all
i=1
20.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: City.all.sample.id, description: Faker::Lorem.sentence(word_count: 10), email: Faker::Internet.email, age: rand(5..100))
  puts "User n°#{i} created"
  i += 1
end

Tag.destroy_all
i=1
20.times do
  tag = Tag.create!(title: Faker::Superhero.power)
  puts "Tag n°#{i} created"
  i += 1
end

Gossip.destroy_all
i=1
10.times do
  gossip = Gossip.create!(title: Faker::Book.title, content: Faker::Lorem.sentence(word_count: 10), user_id: User.all.sample.id)
  puts "Gossip n°#{i} created"
  i += 1
end

Join.destroy_all
i=1
40.times do
  join = Join.create!(gossip_id: Gossip.all.sample.id, tag_id: Tag.all.sample.id)
  puts "Junction n°#{i} created"
  i += 1
end

PrivateMessage.destroy_all
i=1
40.times do
  pm = PrivateMessage.create!(sender_id: User.all.sample.id, recipient_id: User.all.sample.id, content: Faker::Lorem.sentence(word_count: 10))
  puts "Private Message n°#{i} created"
  i += 1
end
