class AddTitleColumnToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :title, :string
  end
end
