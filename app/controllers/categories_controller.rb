class CategoriesController < ApplicationController
  
  before_action :find_category, only: [:edit, :update, :show, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def show
    @categories = Category.where(category: @category.category)
  end

  def create
    @category.new(category_params)
      if @category.save
        redirect_to categories_path
    else
      render :new
    end
  end

  def destroy
    if @category.destroy
      redirect_to categories_path
    else
      flash[:error] = " The category wasn't destroyed, see error logs and try again!"
      redirect_to categories_path
    end
  end

  private

    def category_params
      params.require(:category).permit(:category, :sub_category)
    end

    def find_category
      @category = Category.find(params[:id])
    end

end


