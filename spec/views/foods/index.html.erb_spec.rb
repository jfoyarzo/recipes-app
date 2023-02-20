require 'rails_helper'

RSpec.describe 'foods/index', type: :view do
  before(:each) do
    assign(:foods, [
             Food.create!(
               name: 'Name',
               measurement: 'Measurement',
               unit: 'Unit',
               price: '9.99',
               quantity: 'MyText'
             ),
             Food.create!(
               name: 'Name',
               measurement: 'Measurement',
               unit: 'Unit',
               price: '9.99',
               quantity: 'MyText'
             )
           ])
  end

  it 'renders a list of foods' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Measurement'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Unit'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('9.99'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
  end
end
