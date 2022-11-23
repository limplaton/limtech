require 'rails_helper'

RSpec.describe "designations/edit", type: :view do
  let(:designation) {
    Designation.create!(
      name: "MyString",
      department: "MyString"
    )
  }

  before(:each) do
    assign(:designation, designation)
  end

  it "renders the edit designation form" do
    render

    assert_select "form[action=?][method=?]", designation_path(designation), "post" do

      assert_select "input[name=?]", "designation[name]"

      assert_select "input[name=?]", "designation[department]"
    end
  end
end
