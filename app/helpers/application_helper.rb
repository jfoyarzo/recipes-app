module ApplicationHelper
  def recipe_total_value(recipe)
    recipe.recipe_foods.sum { |rf| rf.food.price * rf.quantity }
  end
end
