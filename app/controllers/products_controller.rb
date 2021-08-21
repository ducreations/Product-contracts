class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create 
    @product = Product.new(prod_params)
    if @product.save
      redirect_to products_path
    else 
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to products_path, notice: "Product Removed!"
    end
  end

  private

  def set_prod
    @product = Product.find(params[:id])
  end

  def prod_params
    params.require(:product).permit(:name, :status, :price, :user_id)
  end
end
