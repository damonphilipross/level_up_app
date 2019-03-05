class ChangeColumnInUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :influencer, :boolean, default: false
  end
end
