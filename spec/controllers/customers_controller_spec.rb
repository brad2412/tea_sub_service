require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  let(:valid_attributes) {
    { first_name: 'John', last_name: 'Doe', email: 'john@example.com', address: '123 Main St' }
  }

  describe 'GET #index' do
    it 'returns a success response' do
      customer = Customer.create! valid_attributes
      get :index, format: :json
      expect(response).to be_successful
    end
  end
end