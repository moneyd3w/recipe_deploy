class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[ show edit update destroy ]
  def index
    @ingredients = Ingredient.all
  end
  
  def show
  end

  def newest
  end

  def oldest
  end

  def new
    if session[:user_id].nil?
      redirect_to signin_path, alert: "You must first be logged in to access that page"
    else
      @ingredient = Ingredient.new
    end
  end

  def edit
  end

  def create # add page
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.user_infos_id = @user.id

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to ingredient_url(@ingredient), notice: "Ingredient was successfully created." }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to ingredient_url(@ingredient), notice: "Ingredient was successfully updated." }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy # admin and owner only
    @ingredient.destroy!

    respond_to do |format|
      format.html { redirect_to ingredients_url, notice: "Ingredient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:name, :my_type_column, :description, :recipe, :instructions)
    end
end
