class ProductsController < ApplicationController
  def index
    if params[:mode] == "owned"
      @products = current_user.products
    elsif params[:mode] == "offers"
      @products = Product.where.not(user: current_user)
    else
      @products = Product.all
    end
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

  def agree
    current_user.contracts.create(
      product_id: params[:id]
    )
    redirect_to products_path, notice: "Product Accepted"
  end

  private

  def set_prod
    @product = Product.find(params[:id])
  end

  def prod_params
    params.require(:product).permit(:name, :status, :price, :user_id)
  end
end
