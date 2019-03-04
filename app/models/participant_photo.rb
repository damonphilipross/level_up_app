class ParticipantPhoto < ApplicationRecord
  belongs_to :participant
  belongs_to :daily_goal_task
end
