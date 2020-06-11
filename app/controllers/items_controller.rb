class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]

  def index
    @shop = Shop.find(params[:shop_id])
    @items = @shop.items
  end

  def show
    @shop = Shop.find(params[:shop_id])
    @item = Item.find(params[:id])
  end

  def new
    @shop = Shop.find(params[:shop_id])
    #@item = Item.new
    @item = @shop.items.build

  end

  def create
    @shop = Shop.find(params[:shop_id])
    @item = @shop.items.create(set_params)
    if @item.save
      redirect_to shop_path(@item.shop)
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
    params.require(:item).permit(:name, :description, :image, :quantity, :price, :sku, category_ids: [])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
