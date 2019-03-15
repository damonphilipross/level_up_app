# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "cleaning all tables"
ParticipantBadge.destroy_all
Participant.destroy_all
Challenge.destroy_all
User.destroy_all
DailyGoal.destroy_all
DailyGoalTask.destroy_all
TaskResult.destroy_all
Badge.destroy_all
ParticipantPhoto.destroy_all
puts "starting seed"
user = User.create(handle: "dale_d", email: "dale@hindle.com", password: "password", influencer: true)
user = User.create(handle: "damon_d", email: "damon@damon.com", password: "password", influencer: true)
user = User.create(handle: "ben_b", email: "ben@ben.com", password: "password", influencer: true)
puts "creating users"
15.times do
  user = User.create!(
    handle: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "password",
    photo: Faker::Avatar.image)
  user.save!
end
puts "creating challenges creating daily goals"
20.times do
  metric_verb = Faker::Verb.base
  duration_days = rand(1..50)
  challenge = Challenge.new(
    title: "#{duration_days} day #{metric_verb} challenge",
    description: Faker::Quote.yoda,
    start_date: Faker::Date.forward(50),
    duration_days: duration_days,
    cost: rand(500),
    photo_url: Faker::LoremPixel.image("600x400", false, 'sports'),
    price_cents: rand(50000),
  )
  challenge.user = User.first(3).sample
  challenge.save!
  i = 0
  challenge.duration_days.times do
    i = i + 1
    daily_goal = DailyGoal.new(
      day: i,
    )
    daily_goal.challenge = challenge
    daily_goal.save!
    daily_goal_tasks = DailyGoalTask.new(
      description: Faker::Company.bs,
      task_points: rand(20),
    )
    daily_goal_tasks.daily_goal = daily_goal
    daily_goal_tasks.save!
  end
end
puts "creating participations"
User.last(10).each do |user|
  challenge_array = Challenge.all.to_a
  5.times do
    participant = Participant.new
    participant.user = user
    participant.challenge = challenge_array.pop
    # challenge_array = challenge_array.delete(participant.challenge)
    @task_result = TaskResult.new
    participant.challenge.daily_goals.each do |goal|
      goal.daily_goal_tasks.each do |task|
        @task_result.daily_goal_task = task
        @task_result.participant = participant
        @task_result.complete = false
        @task_result.save!
      end
    end
    puts user.id
    participant.save!
  end
end
puts "creating special challenge lol ;)"
metric_verb = Faker::Verb.base
duration_days = rand(1..50)
challenge = Challenge.new(
  title: "40 days and 40 nights body transformation challenge",
  description: "This is our core product. This is what we have built our reputation on. Effective, efficient, and fun training. The foundation of our successful training programs are based on strength work. You NEED to lift weights. That's why at Levelup Industrial we ensure that anyone from a beginner to an advanced lifter will progress closer towards their specific goals.
  At Levelup Industrial we believe that technique is key, you have to earn the ability to lift, and from this you then earn the ability to lift heavier. We teach you this in a non intimidating environment, with world class equipment, and world class trainers.",
  start_date: Faker::Date.forward(50),
  duration_days: 40,
  cost: rand(500),
  photo_url: "https://unsplash.com/photos/AkEr0jc5Lvs",
  price_cents: rand(50000)
)

challenge.user = User.first(3).sample
challenge.save!
i = 0
challenge.duration_days.times do
  i = i + 1
  daily_goal = DailyGoal.new(
    day: i,
  )
  daily_goal.challenge = challenge
  daily_goal.save!
  daily_goal_tasks = DailyGoalTask.new(
    description: Faker::Company.bs,
    task_points: rand(20),
  )
  daily_goal_tasks.daily_goal = daily_goal
  daily_goal_tasks.save!
end
user_array = User.all.to_a
10.times do
    participant = Participant.new
    participant.user = user_array.pop
    participant.challenge = challenge
    @task_result = TaskResult.new
    participant.challenge.daily_goals.each do |goal|
      goal.daily_goal_tasks.each do |task|
        @task_result.daily_goal_task = task
        @task_result.participant = participant
        @task_result.complete = false
        @task_result.save!
      end
    end
    puts user.id
    participant.save!
end



puts "creating badges"
Badge.create!(
    badge_points: rand(20),
    badge_name: "#{Faker::Games::LeagueOfLegends.rank} Badge",
    icon_name: "https://discordemoji.com/assets/emoji/fire.png",
    color: Faker::Color.hex_color,
)
Badge.create!(
    badge_points: rand(20),
    badge_name: "#{Faker::Games::LeagueOfLegends.rank} Badge",
    icon_name: "https://discordemoji.com/assets/emoji/Cheers.gif",
    color: Faker::Color.hex_color,
)
Badge.create!(
    badge_points: rand(20),
    badge_name: "#{Faker::Games::LeagueOfLegends.rank} Badge",
    icon_name: "https://discordemoji.com/assets/emoji/SansDab.png",
    color: Faker::Color.hex_color,
)
Badge.create!(
    badge_points: rand(20),
    badge_name: "#{Faker::Games::LeagueOfLegends.rank} Badge",
    icon_name: "https://discordemoji.com/assets/emoji/CatHeartEyes.png",
    color: Faker::Color.hex_color,
)
Badge.create!(
    badge_points: rand(20),
    badge_name: "#{Faker::Games::LeagueOfLegends.rank} Badge",
    icon_name: "https://discordemoji.com/assets/emoji/VictoryRoyale.png",
    color: Faker::Color.hex_color,
)

puts "amalgamating the badges with rando users"

5.times do
  participant_badge = ParticipantBadge.new
  participant_badge.participant = Participant.all.sample
  participant_badge.badge = Badge.all.sample
  participant_badge.save!
end

puts "seed complete"
