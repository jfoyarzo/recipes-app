require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject do
    @user = User.create(name: 'Someone')
    @food = Food.create(name: 'Food', measurement_unit: 'grams', price: 15.5, quantity: 15, user: @user, user_id: 1)
    @recipe = Recipe.create(name: 'Recipe', preparation_time: '00:50', cooking_time: '04:00',
                            description: 'description', public: true, user: @user, user_id: 1)
    @recipe_food = RecipeFood.create(quantity: 15, food: @food, recipe: @recipe, food_id: 2, recipe_id: 1)
  end

  before { subject.save }

  it 'quantity should be present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'quantity should not be empty' do
    subject.quantity = ' '
    expect(subject).to_not be_valid
  end

  it 'quantity should have valid value' do
    expect(subject.quantity).to eql 15
  end
end
