require 'rails_helper'

RSpec.describe "Teas", type: :request do
  let(:valid_attributes) {
    { title: 'Green Tea', description: 'Healthy green tea', temperature: 80, brew_time: 3 }
  }

  describe "GET /teas" do
    it "returns a success response" do
      tea = Tea.create! valid_attributes
      get teas_path, as: :json
      expect(response).to have_http_status(:ok)
    end
  end
end
