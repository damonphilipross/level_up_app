class AddSpotsTakenToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :spots_taken, :integer
  end
end
