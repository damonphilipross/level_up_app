class AddRemainingSpotsToChallenges < ActiveRecord::Migration[5.2]
  def challenges
    add_column :challenges, :remaining_spots
  end
end
