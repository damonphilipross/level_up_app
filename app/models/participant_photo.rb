class ParticipantPhoto < ApplicationRecord
  belongs_to :participant
  belongs_to :daily_goal_task
  validates :photo_url, presence: true
end
