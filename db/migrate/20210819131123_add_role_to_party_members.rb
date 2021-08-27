class AddRoleToPartyMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :party_members, :role, :integer, default: 0
  end
end
