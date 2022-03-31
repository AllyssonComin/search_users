require "json"
require "open-uri"

User.destroy_all

url = "https://randomuser.me/api/?results=30&seed=giga&format=json&inc=gender,name,email,Picture&nat=br"
user_serialized = URI.open(url).read
user_api = JSON.parse(user_serialized)

results = user_api["results"]

results.each do |user|
  file = URI.open(user['picture']['medium'])
  u = User.create!(
    name: "#{user['name']['first']} #{user['name']['last']}",
    gender: "#{user['gender']}",
    email: "#{user['email']}"
  )
  u.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
  # u.remote_picture_url = user['picture']['medium']
  # u.save!
  puts "#{u.name} created!"
end
