require 'rails_helper'

RSpec.describe "clients/index", type: :view do
  before(:each) do
    assign(:clients, [
      Client.create!(
        firt_name: "Firt Name",
        last_name: "Last Name",
        username: "Username",
        email: "Email",
        password: "",
        client_id: "Client",
        phone: "Phone",
        company_name: "Company Name",
        project_read: false,
        project_write: false,
        project_create: false,
        project_delete: false,
        task_read: false,
        task_write: false,
        task_create: false,
        task_delete: false,
        chat_read: false,
        chat_write: false,
        chat_create: false,
        chat_delete: false,
        timing_sheet_read: false,
        timing_sheet_write: false,
        timing_sheet_create: false,
        timing_sheet_delete: false,
        avatar: "Avatar"
      ),
      Client.create!(
        firt_name: "Firt Name",
        last_name: "Last Name",
        username: "Username",
        email: "Email",
        password: "",
        client_id: "Client",
        phone: "Phone",
        company_name: "Company Name",
        project_read: false,
        project_write: false,
        project_create: false,
        project_delete: false,
        task_read: false,
        task_write: false,
        task_create: false,
        task_delete: false,
        chat_read: false,
        chat_write: false,
        chat_create: false,
        chat_delete: false,
        timing_sheet_read: false,
        timing_sheet_write: false,
        timing_sheet_create: false,
        timing_sheet_delete: false,
        avatar: "Avatar"
      )
    ])
  end

  it "renders a list of clients" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Firt Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Username".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Client".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Phone".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Company Name".to_s), count: 2
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
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Avatar".to_s), count: 2
  end
end
