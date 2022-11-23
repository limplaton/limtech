require 'rails_helper'

RSpec.describe "designations/show", type: :view do
  before(:each) do
    assign(:designation, Designation.create!(
      name: "Name",
      department: "Department"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Department/)
  end
end
