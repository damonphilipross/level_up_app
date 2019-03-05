class AddCostToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_monetize :challenges, :price, currency: { present: false }
  end
end
