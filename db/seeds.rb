# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Sample Demo User

user = User.find_by(email: 'demo@example.com')

if !user
  user = User.new
  user.email = 'demo@example.com'
  user.password = 'password'
  user.password_confirmation = 'password'
  user.save!
end

if user.pools.count > 0
  user.pools.destroy_all
end

pool = user.pools.new
pool.volume = 20000
pool.save!

date = Time.now - 53.weeks

52.times do
  reading = pool.readings.new
  reading.datetime = date
  reading.ph = rand(6.0..9.0).round(1)
  reading.alkalinity = rand(50..180)
  reading.stabilizer = rand(0..100)
  reading.chlorine = rand(0..10)
  reading.airtemp = rand(0..110)
  reading.watertemp = rand(50..100)
  reading.save!

  date = date + rand(5..9).days + rand(-12..12).hours

end