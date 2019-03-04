class ParticipantBadge < ApplicationRecord
  belongs_to :badge
  belongs_to :participant
end
