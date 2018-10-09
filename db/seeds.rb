require 'faker'

Restaurant.destroy_all

10.times do
  Restaurant.create!(
    name: Faker::HarryPotter.character,
    address: Faker::LordOfTheRings.location,
    capacity: rand(20..60)
  )
end
