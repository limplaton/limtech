require 'rails_helper'

RSpec.describe "clients/new", type: :view do
  before(:each) do
    assign(:client, Client.new(
      firt_name: "MyString",
      last_name: "MyString",
      username: "MyString",
      email: "MyString",
      password: "",
      client_id: "MyString",
      phone: "MyString",
      company_name: "MyString",
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
      avatar: "MyString"
    ))
  end

  it "renders new client form" do
    render

    assert_select "form[action=?][method=?]", clients_path, "post" do

      assert_select "input[name=?]", "client[firt_name]"

      assert_select "input[name=?]", "client[last_name]"

      assert_select "input[name=?]", "client[username]"

      assert_select "input[name=?]", "client[email]"

      assert_select "input[name=?]", "client[password]"

      assert_select "input[name=?]", "client[client_id]"

      assert_select "input[name=?]", "client[phone]"

      assert_select "input[name=?]", "client[company_name]"

      assert_select "input[name=?]", "client[project_read]"

      assert_select "input[name=?]", "client[project_write]"

      assert_select "input[name=?]", "client[project_create]"

      assert_select "input[name=?]", "client[project_delete]"

      assert_select "input[name=?]", "client[task_read]"

      assert_select "input[name=?]", "client[task_write]"

      assert_select "input[name=?]", "client[task_create]"

      assert_select "input[name=?]", "client[task_delete]"

      assert_select "input[name=?]", "client[chat_read]"

      assert_select "input[name=?]", "client[chat_write]"

      assert_select "input[name=?]", "client[chat_create]"

      assert_select "input[name=?]", "client[chat_delete]"

      assert_select "input[name=?]", "client[timing_sheet_read]"

      assert_select "input[name=?]", "client[timing_sheet_write]"

      assert_select "input[name=?]", "client[timing_sheet_create]"

      assert_select "input[name=?]", "client[timing_sheet_delete]"

      assert_select "input[name=?]", "client[avatar]"
    end
  end
end
