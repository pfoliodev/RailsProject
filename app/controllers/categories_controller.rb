class CategoriesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_category, only: [:show, :update, :destroy, :edit]

  def index
    @session = session[:user_id]
    @categories = Category.all
  end

  def show
  end

  def update
    @category.update(category_params)
    redirect_to categories_path
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    redirect_to categories_path
  end

  def edit

  end

  private

  def category_params
    params.require(:category).permit(:title, :slug)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
