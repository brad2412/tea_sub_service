require 'rails_helper'

RSpec.describe TeasController, type: :controller do
  let(:valid_attributes) {
    { title: 'Green Tea', description: 'Healthy green tea', temperature: 80, brew_time: 3 }
  }

  describe 'GET #index' do
    it 'returns a success response' do
      tea = Tea.create! valid_attributes
      get :index, format: :json
      expect(response).to be_successful
    end
  end
end