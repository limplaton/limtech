class AddRoleToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :role, :integer
  end
end
