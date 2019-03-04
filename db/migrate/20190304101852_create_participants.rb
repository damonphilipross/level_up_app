class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.references :user, foreign_key: true
      t.references :challenge, foreign_key: true
      t.integer :total_points

      t.timestamps
    end
  end
end
