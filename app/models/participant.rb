class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_many :participant_photos, dependent: :destroy
end
