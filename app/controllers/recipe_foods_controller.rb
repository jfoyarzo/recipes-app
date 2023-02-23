class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show edit update destroy]

  # GET /recipe_foods or /recipe_foods.json
  def index
    @recipe_foods = RecipeFood.all

    # show all foods in all recipes that are missing from the inventory
    @shopping_list = User.create_shopping_list(current_user.id)
  end

  # GET /recipe_foods/1 or /recipe_foods/1.json
  def show; end

  # GET /recipe_foods/new
  def new
    @recipe_food = RecipeFood.new
  end

  # GET /recipe_foods/1/edit
  def edit; end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe_food = RecipeFood.new(quantity: params[:recipe_food][:quantity])
    @recipe_food.food = Food.find_by(name: params[:recipe_food][:food])
    @recipe_food.recipe = Recipe.find(params[:recipe_food][:recipe_id])

    respond_to do |format|
      if @recipe_food.save
        format.html do
          redirect_to recipe_url(@recipe_food.recipe), notice: 'The ingredient was successfully added to the recipe.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_foods/1 or /recipe_foods/1.json
  def update
    respond_to do |format|
      if @recipe_food.update(recipe_food_params)
        format.html { redirect_to recipe_food_url(@recipe_food), notice: 'Recipe food was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food.destroy

    respond_to do |format|
      format.html { redirect_to recipe_url(@recipe_food.recipe), notice: 'Ingredient deleted successfully.' }
    end
  end
  
  private
  
    # find missing ingredients in a recipe
    # 1. all recipes of the current user
    # 2. all foods in the inventory of the current user
    # 3. loop through all recipes and find foods that are not in the inventory
    #def missing_ingredients
    #  @recipes = current_user.recipes
    #  @inventory = current_user.foods
    #  @ingredients = []
    #  @recipes.each do |r|
    #    @ingredients << r.recipe_foods
    #  end
    #  @qinventory = @inventory.map do |i|
    #    i.quantity
    #  end
    #  @qingredients = @ingredients.map do |i|
    #    i.quantity
    #  end
    #  @missing = @qingredients - @qinventory
    #end

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food, :recipe_id)
  end
end
