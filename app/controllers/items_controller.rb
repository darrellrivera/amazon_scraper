class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = "Item succesfully saved"
      redirect_to :action => "show", :id => @item.id
    else
      flash[:error] = @item.errors.full_messages
      render :new
    end
  end

  def show
    @item = Item.find_by_id(params[:id])
  end

  def edit
    @item = Item.find_by_id(params[:id])
  end

  def update
    @item = Item.find_by_id(params[:id])
    @item.attributes = item_params

    if @item.save
      flash[:notice] = "Item succesfully saved"
      redirect_to :action => "show", :id => @item.id
    else
      flash[:error] = @item.errors.full_messages
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:id, :target_price, :url)
  end
end
