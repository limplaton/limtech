require 'rails_helper'

RSpec.describe "overtimes/index", type: :view do
  before(:each) do
    assign(:overtimes, [
      Overtime.create!(
        name: "Name",
        hours: 2,
        description: "Description",
        status: "Status",
        approve: "Approve"
      ),
      Overtime.create!(
        name: "Name",
        hours: 2,
        description: "Description",
        status: "Status",
        approve: "Approve"
      )
    ])
  end

  it "renders a list of overtimes" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Status".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Approve".to_s), count: 2
  end
end
