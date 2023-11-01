require 'rails_helper'

RSpec.describe "Customers", type: :request do
  let(:valid_attributes) {
    { first_name: 'John', last_name: 'Doe', email: 'john@example.com', address: '123 Main St' }
  }

  describe "GET /customers" do
    it "returns a success response" do
      customer = Customer.create! valid_attributes
      get customers_path, as: :json
      expect(response).to have_http_status(:ok)
    end
  end

end