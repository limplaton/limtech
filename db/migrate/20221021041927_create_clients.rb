class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :firt_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :client_id
      t.string :phone
      t.string :company_name
      t.boolean :project_read
      t.boolean :project_write
      t.boolean :project_create
      t.boolean :project_delete
      t.boolean :task_read
      t.boolean :task_write
      t.boolean :task_create
      t.boolean :task_delete
      t.boolean :chat_read
      t.boolean :chat_write
      t.boolean :chat_create
      t.boolean :chat_delete
      t.boolean :timing_sheet_read
      t.boolean :timing_sheet_write
      t.boolean :timing_sheet_create
      t.boolean :timing_sheet_delete
      t.string :avatar

      t.timestamps
    end
  end
end
