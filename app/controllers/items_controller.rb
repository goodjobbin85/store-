class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def edit

  end



  def update
    if @item.update(set_params)
      redirect_to item_path(@item)
    else
      render :edit
    end 
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def set_params
    params.require(:item).permit(:name, :description, :image, :quantity, :price, :sku)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
