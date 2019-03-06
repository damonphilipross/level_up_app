class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_many :participant_photos, dependent: :destroy
  has_many :participant_badges, dependent: :destroy
  has_many :badges, through: :participants_badges
  has_many :task_results, dependent: :destroy
end
