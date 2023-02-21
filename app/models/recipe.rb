class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  scope :recent_recipes, -> { Recipe.where(public: true).last(5) }
end
