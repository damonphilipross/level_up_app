class RemoveSpotsTakenFromChallenges < ActiveRecord::Migration[5.2]
  def change
    remove_column :challenges, :spots_taken, :integer
  end
end
