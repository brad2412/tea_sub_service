require 'rails_helper'

RSpec.describe SubscriptionsController, type: :controller do
  let(:valid_subscription_attributes) {
    { title: 'Monthly Subscription', price: 10, status: 'active', frequency: 'monthly' }
  }

  describe 'POST #create' do
    it 'creates a new subscription' do
      post :create, params: { subscription: valid_subscription_attributes }, format: :json
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT #update' do
    it 'updates (cancels) a subscription' do
      subscription = Subscription.create! valid_subscription_attributes
      put :update, params: { id: subscription.to_param, subscription: { status: 'inactive' } }, format: :json
      expect(response).to have_http_status(:no_content)
      
      # You can also check the status of the subscription to be "inactive" if that's what "canceling" means
      subscription.reload
      expect(subscription.status).to eq('inactive')
    end
  end

  describe 'GET #index' do
    it 'returns a list of customer subscriptions' do
      customer = Customer.create!(first_name: 'Alice', last_name: 'Smith', email: 'alice@example.com', address: '456 Elm St')
      customer.subscriptions.create!(valid_subscription_attributes)

      get :index, params: { customer_id: customer.to_param }, format: :json
      expect(response).to be_successful
    end
  end
end
