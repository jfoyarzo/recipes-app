require 'rails_helper'

RSpec.describe "foods/show", type: :view do
  before(:each) do
    assign(:food, Food.create!(
      name: "Name",
      measurement: "Measurement",
      unit: "Unit",
      price: "9.99",
      quantity: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Measurement/)
    expect(rendered).to match(/Unit/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
  end
end
