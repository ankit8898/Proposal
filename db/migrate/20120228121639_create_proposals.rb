class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :proposal_name
      t.text :description

      t.timestamps
    end
  end
end
