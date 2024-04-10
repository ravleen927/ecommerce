class ProductCategory < ApplicationRecord
  belongs_to :product
  belongs_to :category

  def show
    @category = Category.find(params[:id])
    @products = ProductCategory.where(category_id: @category.id).map(&:product)
end
end 
