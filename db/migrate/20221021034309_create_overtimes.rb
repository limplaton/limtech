class CreateOvertimes < ActiveRecord::Migration[7.0]
  def change
    create_table :overtimes do |t|
      t.string :name
      t.date :date
      t.integer :hours
      t.string :description
      t.string :status
      t.string :approve

      t.timestamps
    end
  end
end
