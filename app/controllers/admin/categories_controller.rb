class Admin::CategoriesController < ApplicationController
  def index
    @category = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Product.new(category_params)

    if @category.save
      redirect_to [:admin, :category], notice: 'Product created!'
    else
      render :new
    end
  end
end
