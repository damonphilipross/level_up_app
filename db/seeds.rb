# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "cleaning all tables"
Badge.destroy_all
Participant.destroy_all
Challenge.destroy_all
User.destroy_all
DailyGoalTask.destroy_all
DailyGoals.destroy_all
ParticipantBadges.destroy_all
ParticipantPhotos.destroy_all
TaskResults.destroy_all
puts "starting seed"
user = User.create(handle: "dale_d", email: "dale@hindle.com", password: "password", influencer: true)
user = User.create(handle: "damon_d", email: "damon@damon.com", password: "password", influencer: true)
user = User.create(handle: "ben_b", email: "ben@ben.com", password: "password", influencer: true)
puts "creating users"
10.times do
  user = User.create!(
    handle: Faker::Internet.username(seperators=(. _)),
    email: Faker::Internet.email,
    password: "password")
  # user.save
end
puts "creating challenges"
20.times do
  metric_verb = Faker::Verb.base
  challenge = Challenge.new(
    title: "#{rand(50)} day #{metric_verb} challenge",
    tag: Challenge::Tag.sample,
    detail: Faker::Quote.yoda,
    start_date: Faker::Date.forward(50),
    duration: rand(50),
    cost: rand(500.00),
    metric_verb: metric_verb,
    metric_value: rand(50.0),
    metric_frequency: ["day", "week", "month", "decade"].sample,
    metric_operator: ["greater than", "less than", "equal to"].sample,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    location: Faker::Address.full_address)
  challenge.user = User.first(3).sample
  challenge.save!

end
puts "creating participations"
User.last(10).each do |user|
  2.times do
    participant = Participant.new
    participant.user = user
    participant.challenge = Challenge.all.sample
    participant.save!
  end
end

puts "seed complete"
