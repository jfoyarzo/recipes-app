require 'rails_helper'

RSpec.describe 'recipes/show', type: :view do
  before(:each) do
    assign(:recipe, Recipe.create!(
                      name: 'Name',
                      preparation: 'Preparation',
                      cooking: 'Cooking',
                      description: 'MyText',
                      public: false
                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Preparation/)
    expect(rendered).to match(/Cooking/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
