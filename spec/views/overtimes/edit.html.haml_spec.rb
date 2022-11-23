require 'rails_helper'

RSpec.describe "overtimes/edit", type: :view do
  let(:overtime) {
    Overtime.create!(
      name: "MyString",
      hours: 1,
      description: "MyString",
      status: "MyString",
      approve: "MyString"
    )
  }

  before(:each) do
    assign(:overtime, overtime)
  end

  it "renders the edit overtime form" do
    render

    assert_select "form[action=?][method=?]", overtime_path(overtime), "post" do

      assert_select "input[name=?]", "overtime[name]"

      assert_select "input[name=?]", "overtime[hours]"

      assert_select "input[name=?]", "overtime[description]"

      assert_select "input[name=?]", "overtime[status]"

      assert_select "input[name=?]", "overtime[approve]"
    end
  end
end
