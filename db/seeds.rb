# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bathroom.create!(description: 'bathroom1')
Bathroom.create!(description: 'bathroom2')
Bathroom.create!(description: 'bathroom3')

count = 1

6.times do
  User.create(nickname: "Bot#{count}")
  count += 1
end

count = 1

3.times do
  user  = User.find_by(nickname: "Bot#{count}")
  score = count * 100 
  Score.create(user_id: user.id, points: score)
  count += 1
end

3.times do
  user  = User.find_by(nickname: "Bot#{count}")
  score = count * -100 
  Score.create(user_id: user.id, points: score)
  count += 1
end