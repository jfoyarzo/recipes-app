require 'rails_helper'

RSpec.describe 'foods/edit', type: :view do
  let(:food) do
    Food.create!(
      name: 'MyString',
      measurement: 'MyString',
      unit: 'MyString',
      price: '9.99',
      quantity: 'MyText'
    )
  end

  before(:each) do
    assign(:food, food)
  end

  it 'renders the edit food form' do
    render

    assert_select 'form[action=?][method=?]', food_path(food), 'post' do
      assert_select 'input[name=?]', 'food[name]'

      assert_select 'input[name=?]', 'food[measurement]'

      assert_select 'input[name=?]', 'food[unit]'

      assert_select 'input[name=?]', 'food[price]'

      assert_select 'textarea[name=?]', 'food[quantity]'
    end
  end
end
