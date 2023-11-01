require 'rails_helper'

RSpec.describe "Subscriptions", type: :request do
  let(:valid_subscription_attributes) {
    { title: 'Monthly Subscription', price: 10, status: 'active', frequency: 'monthly' }
  }

  describe "POST /customers/:customer_id/subscriptions" do
    it "creates a new subscription" do
      customer = Customer.create!(first_name: 'Alice', last_name: 'Smith', email: 'alice@example.com', address: '456 Elm St')
      tea = Tea.create!(title: 'Green Tea', description: 'Healthy green tea', temperature: 80, brew_time: 3)

      post customer_subscriptions_path(customer), params: { subscription: valid_subscription_attributes, tea_id: tea.id }, as: :json
      expect(response).to have_http_status(:created)

      expect(Subscription.count).to eq(1)
    end
  end

  describe "DELETE /customers/:customer_id/subscriptions/:id" do
    it "cancels a subscription" do
      customer = Customer.create!(first_name: 'Alice', last_name: 'Smith', email: 'alice@example.com', address: '456 Elm St')
      tea = Tea.create!(title: 'Green Tea', description: 'Healthy green tea', temperature: 80, brew_time: 3)

      subscription = customer.subscriptions.create(valid_subscription_attributes.merge(tea: tea))

      delete customer_subscription_path(customer, subscription), as: :json
      expect(response).to have_http_status(:no_content)
    end
  end

  describe "GET /customers/:customer_id/subscriptions" do
    it "returns a list of customer subscriptions" do
      customer = Customer.create!(first_name: 'Alice', last_name: 'Smith', email: 'alice@example.com', address: '456 Elm St')
      tea = Tea.create!(title: 'Green Tea', description: 'Healthy green tea', temperature: 80, brew_time: 3)

      subscription = customer.subscriptions.create(valid_subscription_attributes.merge(tea: tea))

      get customer_subscriptions_path(customer), as: :json
      expect(response).to have_http_status(:ok)
    end
  end
end
