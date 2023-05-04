class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer.id
    # @customers = @customer.customer
  end

  def edit
  end

  def update
    @customer = Customer.where(id: params[:format])
    @customer.update(customer_params)
    redirect_to root_path
  end

  def withdrawal
  end

  def withdraw
  end
end


private

def customer_params
  params.require(:customer).permit([:last_name], [:first_name],
    :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number,
    :is_deleted)
end