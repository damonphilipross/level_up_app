class AddTotalSpotsToChallenges < ActiveRecord::Migration[5.2]
  def change
     add_column :challenges, :total_spots, :integer
  end
end
