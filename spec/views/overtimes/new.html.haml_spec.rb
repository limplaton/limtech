require 'rails_helper'

RSpec.describe "overtimes/new", type: :view do
  before(:each) do
    assign(:overtime, Overtime.new(
      name: "MyString",
      hours: 1,
      description: "MyString",
      status: "MyString",
      approve: "MyString"
    ))
  end

  it "renders new overtime form" do
    render

    assert_select "form[action=?][method=?]", overtimes_path, "post" do

      assert_select "input[name=?]", "overtime[name]"

      assert_select "input[name=?]", "overtime[hours]"

      assert_select "input[name=?]", "overtime[description]"

      assert_select "input[name=?]", "overtime[status]"

      assert_select "input[name=?]", "overtime[approve]"
    end
  end
end
