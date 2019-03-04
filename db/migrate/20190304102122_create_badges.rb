class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.integer :badge_points
      t.string :badge_name
      t.string :icon_name
      t.string :color

      t.timestamps
    end
  end
end
