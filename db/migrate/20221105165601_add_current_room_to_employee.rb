class AddCurrentRoomToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :current_room, :integer
  end
end
