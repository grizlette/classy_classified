class CategoriesController < ApplicationController

  before_action :find_category, only: [:edit, :update, :show, :destroy]

  def index
    @categories = Category.order(category_name: :asc).select(:category_name).distinct
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to category_path 
      flash[:notice] = "Your category was successfully updated!"
    else
      flash[:error] = "The category wasn't updated, take a look at the error logs and try again."
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
        flash[:notice] = "Your category was successfully created!"
    else
      render :new
    end
  end

  def destroy
    if @category.destroy
      redirect_to categories_path 
      flash[:notice] = "Your category was successfully destroyed."
    else
      flash[:error] = "The category wasn't destroyed, see error logs and try again!"
      redirect_to categories_path
    end
  end

  def sub_category
    render(json: Category.where(category_name: params[:selectedCategory]))
  end


  private

    def category_params
      params.require(:category).permit(:category_name, :sub_category)
    end

    def find_category
      @category = Category.find_by(id: params[:id])
      unless @category 
        render text: "Couldn't find id with category #{params[:id]}", status: :not_found
      end
    end

end
