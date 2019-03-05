class DailyGoalTask < ApplicationRecord
  belongs_to :daily_goal
  has_many :participant_photos

  validates :description, presence: true
  validates :task_points, presence: true, numericality: { only_integer: true }
end
