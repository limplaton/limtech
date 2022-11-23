class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :employee_id
      t.datetime :join_date
      t.string :phone
      t.string :company
      t.string :department
      t.string :designation
      t.boolean :holiday_read
      t.boolean :holiday_write
      t.boolean :holiday_create
      t.boolean :holiday_delete
      t.boolean :leave_read
      t.boolean :leave_write
      t.boolean :leave_create
      t.boolean :leave_delete
      t.boolean :timesheet_read
      t.boolean :timesheet_write
      t.boolean :timesheet_create
      t.boolean :timesheet_delete
      t.string :avatar

      t.timestamps
    end
  end
end
