class AddDefaultToMembersRole < ActiveRecord::Migration[6.1]
  def change
    change_column_default :members, :role, from: nil, to: 0
  end
end
