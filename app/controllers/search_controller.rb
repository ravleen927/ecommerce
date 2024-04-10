class SearchController < ApplicationController
  def index
    @products = Product.includes(:category)

    if params[:query].present?
      @products = @products.search_by_keyword(params[:query])
    end

    if params[:category_id].present?
      @products = @products.where(category_id: params[:category_id])
    end
  end
end
