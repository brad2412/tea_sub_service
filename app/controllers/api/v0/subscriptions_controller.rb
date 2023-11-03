class Api::V0::SubscriptionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_record

  def create
    sub = Subscription.new(subscription_params)

    if sub.save
      render_subscription(sub, 201)
    else
      render_error(sub.errors.full_messages.to_sentence, 400)
    end
  end

  def update
    sub = Subscription.find(params[:id])

    if sub[:status] == 'active'
      sub.update!(status: 'inactive')
      render_subscription(sub, 200)
    else
      render_error('Subscription is already inactive', 400)
    end
  end

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
  end

  def render_subscription(subscription, status)
    render json: SubscriptionSerializer.new(subscription), status: status
  end

  def render_error(message, status)
    render json: { error: message }, status: status
  end

  def invalid_record(error)
    render json: { error: error.message }, status: 404
  end
end
