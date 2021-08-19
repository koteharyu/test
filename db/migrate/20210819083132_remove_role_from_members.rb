class RemoveRoleFromMembers < ActiveRecord::Migration[6.1]
  def change
    remove_column :members, :role, :integer, default: 0
  end
end
