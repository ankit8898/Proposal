class AddColumnUserIdHasDraftInProposals < ActiveRecord::Migration
  def up
  [:proposals, :proposal_drafts].each do |table_name|
    create_table table_name, :force => true do |t|
      t.references :proposal if table_name == :proposal_drafts
      t.integer :user_id

      t.timestamps
    end
  end
  end

  def down
  end
end
