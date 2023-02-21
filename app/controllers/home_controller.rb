class HomeController < ApplicationController
  def index
    @recent_users = User.last(5)
    @recent_recipes = Recipe.where(public: true).last(5)
  end
end
