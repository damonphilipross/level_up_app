class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.date :start_date
      t.integer :duration_days
      t.integer :cost
      t.string :photo_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
