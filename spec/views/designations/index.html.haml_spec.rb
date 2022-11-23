require 'rails_helper'

RSpec.describe "designations/index", type: :view do
  before(:each) do
    assign(:designations, [
      Designation.create!(
        name: "Name",
        department: "Department"
      ),
      Designation.create!(
        name: "Name",
        department: "Department"
      )
    ])
  end

  it "renders a list of designations" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Department".to_s), count: 2
  end
end
