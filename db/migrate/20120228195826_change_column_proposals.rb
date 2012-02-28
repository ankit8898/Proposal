class ChangeColumnProposals < ActiveRecord::Migration
  def up
  change_column(:proposals, :description, :string)
  end

  def down
  end
end
