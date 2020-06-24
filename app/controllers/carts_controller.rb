class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        redirect_to @cart
      else
        render :new
      end
    end
  end

  def destroy
    @cart.destroy
    session[:cart_id] = nil
    redirect_to shops_path
  end

  private
    def set_cart
      @cart = Cart.find(params[:id])
    end

    def invalid_cart
      logger.error "Attempted to access an invalid cart #{params[:id] }"
      redirect_to root_path
    end

    def cart_params
      params.fetch(:cart, {})
    end
end
