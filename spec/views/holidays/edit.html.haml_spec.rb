require 'rails_helper'

RSpec.describe "holidays/edit", type: :view do
  let(:holiday) {
    Holiday.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:holiday, holiday)
  end

  it "renders the edit holiday form" do
    render

    assert_select "form[action=?][method=?]", holiday_path(holiday), "post" do

      assert_select "input[name=?]", "holiday[name]"
    end
  end
end
