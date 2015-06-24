class ItemsController < ApplicationController

  before_action :find_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    if Item.create(item_params)
      redirect_to items_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to items_path
    else
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
      @item = item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:item_name, :item_price, :item_description, :seller_name, :seller_phone_number, :seller_email, :seller_location, :category_id)
    end

end
