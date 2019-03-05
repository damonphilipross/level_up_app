class Badge < ApplicationRecord
  has_many :participants, through: :participant_badges
end
