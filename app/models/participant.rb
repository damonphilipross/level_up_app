class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_many :participant_photos, dependent: :destroy
  has_many :participant_badges
  has_many :badges, through: :participant_badges
end
