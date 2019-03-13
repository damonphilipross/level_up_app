class AddAvatarPhotoToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :avatar_photo, :string
  end
end
