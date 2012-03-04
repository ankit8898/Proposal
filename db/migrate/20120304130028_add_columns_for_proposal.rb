class AddColumnsForProposal < ActiveRecord::Migration
  def up
  [:proposals, :proposal_drafts].each do |table_name|
    add_column table_name ,:proposal_name ,:string
    add_column table_name ,:description ,:string
    end
    end

  def down
  end
end
