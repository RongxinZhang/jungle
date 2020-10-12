class Admin::DashboardController < ApplicationController
  def show
    # Total products in the DB
    @total_products = Product.count
    # Total categories in the DB
    @total_categories = Category.count
  end
end
