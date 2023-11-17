class MainController < ApplicationController
  before_action :require_setingredient, :require_latestingredient

  def home
    if @random_ingredient.nil? or @random_ingredient.new_record?
      @random_ingredient = random_ingredient(Ingredient.all).first
    end

    if @random_ingredient.nil?
      @random_ingredient = Ingredient.new
    end
  end

  def surprise
    if @set_ingredient.nil?
      @set_ingredient = Ingredient.new
    end
  end

  def index
  end

  def randingredient
    if params[:param1] == "Any"
      @random_ingredient = random_ingredient(Ingredient.all).first
    else
      @random_ingredient = random_ingredient(Ingredient.where(my_type_column: params[:param1])).first
    end

    if @random_ingredient.nil?
      redirect_to surprise_path, notice: 'No recipe found in that category' 
    else
      render :surprise
    end
  end

  def view
  end

  private

  def random_ingredient(ingredients)
    ingredients.order("RANDOM()")
  end

  def require_randingredient
    if @random_ingredient.nil?
      @random_ingredient = Ingredient.new
    end
  end

  def require_setingredient
    @set_ingredient = Ingredient.where(featured: true).order("RANDOM()").first
    
    if @set_ingredient.nil?
      @set_ingredient = random_ingredient(Ingredient.all).first
    end
    if @set_ingredient.nil?
      @set_ingredient = Ingredient.new
    end
  end

  def require_latestingredient
    @latest_ingredient = Ingredient.order(created_at: :desc).first
    if @latest_ingredient.nil?
      @latest_ingredient = Ingredient.new
    end
  end
end
