require 'rails_helper'

RSpec.describe "overtimes/show", type: :view do
  before(:each) do
    assign(:overtime, Overtime.create!(
      name: "Name",
      hours: 2,
      description: "Description",
      status: "Status",
      approve: "Approve"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Approve/)
  end
end
