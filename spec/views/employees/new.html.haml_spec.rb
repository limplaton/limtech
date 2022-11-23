require 'rails_helper'

RSpec.describe "employees/new", type: :view do
  before(:each) do
    assign(:employee, Employee.new(
      first_name: "MyString",
      last_name: "MyString",
      username: "MyString",
      email: "MyString",
      password: "",
      employee_id: "MyString",
      phone: "MyString",
      company: "MyString",
      department: "MyString",
      designation: "MyString",
      holiday_read: false,
      holiday_write: false,
      holiday_create: false,
      holiday_delete: false,
      leave_read: false,
      leave_write: false,
      leave_create: false,
      leave_delete: false,
      timesheet_read: false,
      timesheet_write: false,
      timesheet_create: false,
      timesheet_delete: false,
      avatar: "MyString"
    ))
  end

  it "renders new employee form" do
    render

    assert_select "form[action=?][method=?]", employees_path, "post" do

      assert_select "input[name=?]", "employee[first_name]"

      assert_select "input[name=?]", "employee[last_name]"

      assert_select "input[name=?]", "employee[username]"

      assert_select "input[name=?]", "employee[email]"

      assert_select "input[name=?]", "employee[password]"

      assert_select "input[name=?]", "employee[employee_id]"

      assert_select "input[name=?]", "employee[phone]"

      assert_select "input[name=?]", "employee[company]"

      assert_select "input[name=?]", "employee[department]"

      assert_select "input[name=?]", "employee[designation]"

      assert_select "input[name=?]", "employee[holiday_read]"

      assert_select "input[name=?]", "employee[holiday_write]"

      assert_select "input[name=?]", "employee[holiday_create]"

      assert_select "input[name=?]", "employee[holiday_delete]"

      assert_select "input[name=?]", "employee[leave_read]"

      assert_select "input[name=?]", "employee[leave_write]"

      assert_select "input[name=?]", "employee[leave_create]"

      assert_select "input[name=?]", "employee[leave_delete]"

      assert_select "input[name=?]", "employee[timesheet_read]"

      assert_select "input[name=?]", "employee[timesheet_write]"

      assert_select "input[name=?]", "employee[timesheet_create]"

      assert_select "input[name=?]", "employee[timesheet_delete]"

      assert_select "input[name=?]", "employee[avatar]"
    end
  end
end
