require 'rails_helper'

RSpec.describe 'recipes/index', type: :view do
  before(:each) do
    assign(:recipes, [
             Recipe.create!(
               name: 'Name',
               preparation: 'Preparation',
               cooking: 'Cooking',
               description: 'MyText',
               public: false
             ),
             Recipe.create!(
               name: 'Name',
               preparation: 'Preparation',
               cooking: 'Cooking',
               description: 'MyText',
               public: false
             )
           ])
  end

  it 'renders a list of recipes' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Preparation'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Cooking'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
