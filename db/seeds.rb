# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"
require "open-uri"

url = "https://randomuser.me/api/?results=30&seed=giga&format=json&inc=gender,name,email,Picture&nat=br"
user_serialized = URI.open(url).read
user_api = JSON.parse(user_serialized)

results = user_api["results"]

results.each do |user|
  User.create(
    name: "#{user['name']['title']} #{user['name']['first']} #{user['name']['last']}",
    gender: "#{user['gender']}",
    email: "#{user['email']}"
  )
end
