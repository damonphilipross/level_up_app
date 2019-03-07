class ChangeColumnInParticipants < ActiveRecord::Migration[5.2]
  def change
    change_column :participants, :total_points, :integer, default: 1
  end
end
