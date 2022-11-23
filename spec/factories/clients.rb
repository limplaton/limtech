FactoryBot.define do
  factory :client do
    firt_name { "MyString" }
    last_name { "MyString" }
    username { "MyString" }
    email { "MyString" }
    password { "" }
    client_id { "MyString" }
    phone { "MyString" }
    company_name { "MyString" }
    project_read { false }
    project_write { false }
    project_create { false }
    project_delete { false }
    task_read { false }
    task_write { false }
    task_create { false }
    task_delete { false }
    chat_read { false }
    chat_write { false }
    chat_create { false }
    chat_delete { false }
    timing_sheet_read { false }
    timing_sheet_write { false }
    timing_sheet_create { false }
    timing_sheet_delete { false }
    avatar { "MyString" }
  end
end
