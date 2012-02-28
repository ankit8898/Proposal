class RemoveColumnInCompany < ActiveRecord::Migration
  def up
  remove_column :users ,:company
  end

  def down
  end
end
