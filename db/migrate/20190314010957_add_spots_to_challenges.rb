class AddDetailsToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :total_spots, :integer
    add_column :challenges, :spots_taken, :integer, default: 0
  end
end
