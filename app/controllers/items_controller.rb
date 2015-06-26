class ItemsController < ApplicationController

  before_action :find_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.all
  end

  def show
    current_time = Time.now
    item_created_at = @item.created_at
    user_created_at = @item.user.created_at
    user_created_at_day_of_year = user_created_at.strftime("%j")
    current_day_of_year = current_time.strftime("%j")
    item_created_at_day_of_year = item_created_at.strftime("%j")
    a = user_created_at_day_of_year.scan(/\d+/).join().to_i
    b = item_created_at_day_of_year.scan(/\d+/).join().to_i
    c = current_day_of_year.scan(/\d+/).join().to_i
    @e = c - b
    @x = c - a

  end

  def new
    @item = Item.new
  end

  def create
    if Item.create(item_params)
      redirect_to items_path
    else
      flash[:error] = 'Create did not work'
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to items_path
    else
      flash[:error] = 'Update errors'
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to items_path
    else
      flash[:error] = "Item wasn't destroyed, see error logs and try again!"
      redirect_to items_path
    end
  end



  private
    def find_item
      @item = Item.find_by(id: params[:id])
    unless @item
      flash[:error] = "Person was not found!"
      render(text: "Item not found with ID: #{params[:id]}", status: 404)
    end
    end

    def item_params
      params.require(:item).permit(:item_name, :item_price, :item_description, :seller_phone_number, :seller_location, :category_id, :photo, :user_id)
    end

end
