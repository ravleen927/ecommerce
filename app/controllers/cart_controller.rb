class CartController < ApplicationController
  def show
    @cart_products = Product.where(id: session[:cart])
  end

  def update_quantity
    product_id = params[:product_id].to_i
    quantity = params[:quantity].to_i

    if session[:cart].include?(product_id)
      # Update the quantity directly in the session cart
      session[:cart][product_id] = quantity
      flash[:notice] = 'Quantity updated successfully.'
    else
      flash[:alert] = 'Product not found in cart.'

      
    end

    redirect_to cart_path
  end

  def remove_item
    product_id = params[:product_id]

    session[:cart].delete(product_id.to_i)
    # if session[:cart].is_a?(Array)
    # elsif session[:cart].is_a?(Hash)
    #   session[:cart].delete(product_id.to_i) # Convert to integer if product_id is a string
    # end

    redirect_to cart_path, notice: 'Item removed from cart.'
  end
end