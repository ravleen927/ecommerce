class CheckoutController < ApplicationController
  before_action :authenticate_user!
  def index
    cart_product_ids = session[:cart] || [] # Ensure session[:cart] is not nil
  @cart_products = Product.where(id: cart_product_ids)

  # Calculate subtotal, taxes, and total based on cart products
  subtotal = @cart_products.sum(&:price)
  # Assuming you have access to the user's province information, let's say it's stored in current_user.province
  province = current_user.province.name # Adjust this line based on your actual implementation
  taxes = calculate_taxes(subtotal, province) # Pass the province information
  

  # Populate the @invoice variable
 
    
    # Initialize @cart with an empty hash if it's nil
  end

  def checkout
    # Retrieve cart data from session
    product_id = params[:product_id]
    quantity = session[:cart][product_id]

    # Calculate total amount
    total_amount = calculate_total(product_id, quantity)

    # Calculate taxes based on province
    taxes = calculate_taxes(total_amount)

    # Calculate total amount with taxes
    total_amount_with_taxes = total_amount + taxes

    # Create a guest customer
    customer = Customer.create_guest_customer

    # Create order associated with the guest customer
    order = Order.create(customer: customer, total_amount: total_amount_with_taxes, taxes: taxes)

    # Create order item for the selected product
    product = Product.find(product_id)
    order.order_items.create(name: product.name, price: product.price, quantity: quantity)

    # Clear the cart after checkout
    session[:cart] = nil

    # Redirect to a thank you page or display a success message
    redirect_to root_path, notice: 'Thank you for your purchase!'
  end

  private

  # Method to calculate total amount of the cart
  def calculate_total(cart)
    total = 0
    cart.each do |product_id, quantity|
      product = Product.find(product_id)
      total += product.price * quantity
    end
    total
  end

  # Method to calculate taxes based on total amount and user's province
  def calculate_taxes(total_amount, province)
    case province.downcase
    when 'alberta', 'yukon', 'northwest territories', 'nunavut'
      gst_rate = 0.05 # GST only
      total_amount * gst_rate
    when 'british columbia'
      gst_rate = 0.05
      pst_rate = 0.07
      total_amount * (gst_rate + pst_rate)
    when 'manitoba', 'saskatchewan'
      gst_rate = 0.05
      pst_rate = 0.07
      total_amount * (gst_rate + pst_rate)
    when 'ontario'
      hst_rate = 0.13 # HST
      total_amount * hst_rate
    # Add cases for other provinces or territories
    else
      gst_rate = 0.05
      total_amount * gst_rate
    end
  end

  def product
    product = Product.find(params[:id])
  end
end
