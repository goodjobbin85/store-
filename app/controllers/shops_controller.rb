class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  include CurrentCart
  before_action :set_cart

  def index
    @shops = Shop.all
  end

  def show
    @items = @shop.items.order_by_quantity
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.valid?
      @shop.save
      redirect_to shop_path(@shop)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @shop.update(shop_params)
      redirect_to shop_path(@shop)
    else
      render :edit
    end
  end

  def destroy
    @shop.destroy
    redirect_to shops_path
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name)
  end

end
