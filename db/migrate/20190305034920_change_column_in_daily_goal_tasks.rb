class ChangeColumnInDailyGoalTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :daily_goal_tasks, :task_points, :integer, default: 1
  end
end
