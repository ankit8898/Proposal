class AddUserIdProposals < ActiveRecord::Migration
  def up
  add_column :proposals, :user_id, :integer
  end

  def down
  end
end
