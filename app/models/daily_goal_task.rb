class DailyGoalTask < ApplicationRecord
  belongs_to :daily_goal
  has_many :participant_photos

end
