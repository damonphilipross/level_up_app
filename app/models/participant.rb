class Participant < ApplicationRecord
  acts_as_votable
  belongs_to :user
  belongs_to :challenge
  has_many :participant_photos, dependent: :destroy
  has_many :task_results, dependent: :destroy
  has_many :participant_badges
  has_many :badges, through: :participant_badges
  validates_uniqueness_of :user_id, scope: 'challenge_id'
end
