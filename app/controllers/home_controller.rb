class HomeController < ApplicationController
  def index
    @products = Product.all
    @products = Product.page(params[:page]).per(10)
  end
end
