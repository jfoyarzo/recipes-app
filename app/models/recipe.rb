class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  def recent_recipes
    recipes.order(created_at: :desc).limit(3).reverse
  end
end
