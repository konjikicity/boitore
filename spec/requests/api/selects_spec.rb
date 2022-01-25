require 'rails_helper'

RSpec.describe "Api::Selects", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/selects/index"
      expect(response).to have_http_status(:success)
    end
  end

end
