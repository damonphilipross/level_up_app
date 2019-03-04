class CreateDailyGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_goals do |t|
      t.references :challenge, foreign_key: true
      t.integer :day

      t.timestamps
    end
  end
end
