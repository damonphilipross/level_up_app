class AddSpotsToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :spots, :integer
  end
end
