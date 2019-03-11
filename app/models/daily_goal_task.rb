class DailyGoalTask < ApplicationRecord
  belongs_to :daily_goal
  has_many :participant_photos
  has_many :task_results, dependent: :destroy
  validates :description, presence: true
  validates :task_points, presence: true, numericality: { only_integer: true }
end
