class AddPhotoToParticipantPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :participant_photos, :photo, :string
  end
end
