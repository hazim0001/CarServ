class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show update]

  def index
  end

  def show
  end

  def create
    @customer = Customer.new(customer_params)
    authorize @customer
    if @customer.save
      redirect_to @customer, notice: "New customer has been created"
    else
      error_message = "#{@customer.errors.messages.keys[0].capitalize} #{@customer.errors.messages.values.flatten[0]}"
      redirect_to cutomers_path, alert: error_message
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :phone_number, :license_number, :age, :occupation)
  end
end
