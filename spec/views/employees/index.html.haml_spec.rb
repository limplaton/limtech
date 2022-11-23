require 'rails_helper'

RSpec.describe "employees/index", type: :view do
  before(:each) do
    assign(:employees, [
      Employee.create!(
        first_name: "First Name",
        last_name: "Last Name",
        username: "Username",
        email: "Email",
        password: "",
        employee_id: "Employee",
        phone: "Phone",
        company: "Company",
        department: "Department",
        designation: "Designation",
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
        avatar: "Avatar"
      ),
      Employee.create!(
        first_name: "First Name",
        last_name: "Last Name",
        username: "Username",
        email: "Email",
        password: "",
        employee_id: "Employee",
        phone: "Phone",
        company: "Company",
        department: "Department",
        designation: "Designation",
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
        avatar: "Avatar"
      )
    ])
  end

  it "renders a list of employees" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Username".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Employee".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Phone".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Company".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Department".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Designation".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Avatar".to_s), count: 2
  end
end
