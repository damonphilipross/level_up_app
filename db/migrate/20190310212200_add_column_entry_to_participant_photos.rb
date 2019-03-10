class AddColumnEntryToParticipantPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :participant_photos, :entry, :string
  end
end
