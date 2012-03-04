class AddHasDraftInProposals < ActiveRecord::Migration
  def up
  drop_table :proposals
  [:proposals, :proposal_drafts].each do |table_name|
    create_table table_name, :force => true do |t|
      t.references :proposal if table_name == :proposal_drafts
      t.string :proposal_name
      t.text :description

      t.timestamps
    end
  end
end
  def down
  end
end
