class AddTakenSpotsToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :taken_spots, :integer, default: 0
  end
end
