class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Prosuct.find(params[:id])
  end

end
