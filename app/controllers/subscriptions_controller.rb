class SubscriptionsController < ApplicationController
  before_action :find_customer, only: [:create, :destroy, :index]

  def create
    @subscription = @customer.subscriptions.build(subscription_params)
    if @subscription.save
      render json: @subscription, status: :created
    else
      render json: { errors: @subscription.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @subscription = @customer.subscriptions.find(params[:id])
    if @subscription.destroy
      head :no_content
    else
      render json: { errors: "Failed to cancel subscription" }, status: :unprocessable_entity
    end
  end

  def index
    @subscriptions = @customer.subscriptions
    render json: @subscriptions, status: :ok
  end

  private

  def find_customer
    @customer = Customer.find(params[:customer_id])
  end

  def subscription_params
    params.require(:subscription).permit(:title, :price, :status, :frequency)
  end
end

