class ChangeColumnInTaskResults < ActiveRecord::Migration[5.2]
  def change
    add_column :task_results, :complete, :boolean, default: false
  end
end
