require 'rails_helper'

RSpec.describe "clients/show", type: :view do
  before(:each) do
    assign(:client, Client.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Firt Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Client/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Company Name/)
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
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Avatar/)
  end
end
