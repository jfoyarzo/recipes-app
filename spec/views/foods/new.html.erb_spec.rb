require 'rails_helper'

RSpec.describe 'foods/new', type: :view do
  before(:each) do
    assign(:food, Food.new(
                    name: 'MyString',
                    measurement: 'MyString',
                    unit: 'MyString',
                    price: '9.99',
                    quantity: 'MyText'
                  ))
  end

  it 'renders new food form' do
    render

    assert_select 'form[action=?][method=?]', foods_path, 'post' do
      assert_select 'input[name=?]', 'food[name]'

      assert_select 'input[name=?]', 'food[measurement]'

      assert_select 'input[name=?]', 'food[unit]'

      assert_select 'input[name=?]', 'food[price]'

      assert_select 'textarea[name=?]', 'food[quantity]'
    end
  end
end
