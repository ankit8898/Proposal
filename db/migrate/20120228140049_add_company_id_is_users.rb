class AddCompanyIdIsUsers < ActiveRecord::Migration
  def up
  add_column :users ,:company_id ,:integer
  end

  def down
  end
end
