class CreateParticipantBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :participant_badges do |t|
      t.references :badge, foreign_key: true
      t.references :participant, foreign_key: true

      t.timestamps
    end
  end
end
