class AddDiaryEntryToParticipantPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :participant_photos, :diary_entry, :text
  end
end
