class DailyGoal < ApplicationRecord
  belongs_to :challenge
  has_many :daily_goal_tasks

  validates :day, presence: true, numericality: { only_integer: true }
end
