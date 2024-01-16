class CategoriesController < ApplicationController
  
  before_action :set_post, only: [:edit, :update, :show, :destory]
  
  
  def index
    @categories = Category.all
  end

  def create 
    @category = Category.create(category_params)
    redirect_to category_path(@category.id)
  end

  def show
    @category = Category.find(params[:id])
  end

  def update
    @category.update(category_params)
    redirect_to category_path(@category.id)

  end

  def destroy
    @category.destroy
    redirect_to categories_path

  end

  def new
    @category = Category.new
  end

  def edit
  end
private
  def category_params 
    params.require(:category).permit(:name, :slug)
  end


  def set_post
    @category = Category.find(params[:id])
  end
end
