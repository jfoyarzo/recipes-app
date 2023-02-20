require 'rails_helper'

RSpec.describe "recipes/edit", type: :view do
  let(:recipe) {
    Recipe.create!(
      name: "MyString",
      preparation: "MyString",
      cooking: "MyString",
      description: "MyText",
      public: false
    )
  }

  before(:each) do
    assign(:recipe, recipe)
  end

  it "renders the edit recipe form" do
    render

    assert_select "form[action=?][method=?]", recipe_path(recipe), "post" do

      assert_select "input[name=?]", "recipe[name]"

      assert_select "input[name=?]", "recipe[preparation]"

      assert_select "input[name=?]", "recipe[cooking]"

      assert_select "textarea[name=?]", "recipe[description]"

      assert_select "input[name=?]", "recipe[public]"
    end
  end
end
