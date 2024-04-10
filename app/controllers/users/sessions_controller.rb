# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController

  def create
    super do |resource|
      flash[:notice] = "Welcome back! You have logged in successfully." 
    end
  def destroy
    # Perform additional tasks before signing the user out
    super # Call the original Devise destroy action to sign the user out
    flash[:notice] = "You have been successfully signed out."
    # Additional tasks after signing the user out
  end
end
end
