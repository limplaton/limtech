require 'rails_helper'

RSpec.describe "employees/show", type: :view do
  before(:each) do
    assign(:employee, Employee.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Employee/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Company/)
    expect(rendered).to match(/Department/)
    expect(rendered).to match(/Designation/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Avatar/)
  end
end
