class ItemsController < ApplicationController

  before_action :find_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.all
  end

  def show
    d = Time.now
    a = @item.created_at
    b = d.strftime("%j")
    c = a.strftime("%j")
    f = b.scan(/\d+/).join().to_i
    g = c.scan(/\d+/).join().to_i
    @e = g - f

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
      params.require(:item).permit(:item_name, :item_price, :item_description, :seller_name, :seller_phone_number, :seller_email, :seller_location, :category_id, :photo)
    end

end
