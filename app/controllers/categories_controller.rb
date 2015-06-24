class CategoriesController < ApplicationController

  before_action :find_category, only: [:edit, :update, :show, :destroy]

  def index
    @categories = Category.select(:category_name).distinct
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path(@category.id)
    else
      render :edit
    end
  end

  def show
    @items = @category.items
  end

  def create
    @category = Category.new(category_params)
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

  def sub_category
    #@subcategories = Category.where(category: params[:selectedCategory]).map do |c|
    #  c.sub_category unless c.sub_category.nil?
    #end
    @subcategories = Category.where(category_name: params[:selectedCategory])
    render(json: @subcategories)
  end


  private

    def category_params
      params.require(:category).permit(:category_name, :sub_category)
    end

    def find_category
      @category = Category.find(params[:id])
    end

end
