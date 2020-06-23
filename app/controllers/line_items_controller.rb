class LineItemsController < ApplicationController
  include CurrentCart

  before_action :set_line_item, only: [:destroy]
  before_action :set_cart, only: [:create]

  def create
    item = Item.find(params[:item_id])
    @line_item = @cart.add_item(item)
    if @line_item.save
      redirect_to @line_item.cart
    else
      render :new
    end
  end

  def destroy
    @line_item.destroy
    redirect_to @cart
  end

  private

    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:item_id)
    end
end
