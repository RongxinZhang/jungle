class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    # puts @products.length
    @products.each do |p|
      puts p.quantity
    end
    # return @products
  end

  def show
    @product = Product.find params[:id]
  end

end
