class CreateTaskResults < ActiveRecord::Migration[5.2]
  def change
    create_table :task_results do |t|
      t.references :participant, foreign_key: true
      t.references :daily_goal_task, foreign_key: true

      t.timestamps
    end
  end
end
