class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show update destroy]
  authorize_resource

  def index
    user = current_user
    @recipes = user.recipes.order(created_at: :desc)
  end

  def show; end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public))
    @recipe.user = current_user

    respond_to do |f|
      if @recipe.save
        f.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
      else
        f.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation, :time, :cooking, :time, :description, :public)
  end
end
