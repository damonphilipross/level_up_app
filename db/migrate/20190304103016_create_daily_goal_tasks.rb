class CreateDailyGoalTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_goal_tasks do |t|
      t.string :description
      t.references :daily_goal, foreign_key: true
      t.integer :task_points

      t.timestamps
    end
  end
end
