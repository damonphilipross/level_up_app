class DailyGoal < ApplicationRecord
  belongs_to :challenge
  has_many :daily_goal_tasks
end
