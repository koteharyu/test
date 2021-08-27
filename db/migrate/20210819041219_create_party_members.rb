class CreatePartyMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :party_members do |t|
      t.references :party, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
