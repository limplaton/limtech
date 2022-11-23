FactoryBot.define do
  factory :employee do
    first_name { "MyString" }
    last_name { "MyString" }
    username { "MyString" }
    email { "MyString" }
    password { "" }
    employee_id { "MyString" }
    join_date { "2022-10-20 17:31:24" }
    phone { "MyString" }
    company { "MyString" }
    department { "MyString" }
    designation { "MyString" }
    holiday_read { false }
    holiday_write { false }
    holiday_create { false }
    holiday_delete { false }
    leave_read { false }
    leave_write { false }
    leave_create { false }
    leave_delete { false }
    timesheet_read { false }
    timesheet_write { false }
    timesheet_create { false }
    timesheet_delete { false }
    avatar { "MyString" }
  end
end
