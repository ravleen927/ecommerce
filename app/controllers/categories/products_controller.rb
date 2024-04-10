# app/controllers/categories/products_controller.rb
class Categories::ProductsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @products = @category.products
  end
end
