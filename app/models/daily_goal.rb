class DailyGoal < ApplicationRecord
  belongs_to :challenge
  has_many :daily_goal_tasks, dependent: :destroy
  accepts_nested_attributes_for :daily_goal_tasks
end
