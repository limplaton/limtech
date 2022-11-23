require 'rails_helper'

RSpec.describe "holidays/show", type: :view do
  before(:each) do
    assign(:holiday, Holiday.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
