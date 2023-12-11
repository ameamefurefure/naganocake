class Public::CustomersController < ApplicationController
  def quit
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to new_customer_registration_path
  end
end
