class CreateParticipantPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :participant_photos do |t|
      t.string :photo_url
      t.references :participant, foreign_key: true
      t.references :daily_goal_task, foreign_key: true

      t.timestamps
    end
  end
end
