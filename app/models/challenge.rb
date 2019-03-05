class Challenge < ApplicationRecord
  belongs_to :user
  has_many :daily_goal, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :daily_goal_tasks, dependent: :destroy

  validates :start_date, presence: true
  validates :description, presence: true
  validates :title, presence: true
  validates :duration_days, numericality: { only_integer: true, greater_than: 0 }
  monetize :price_cents
end
