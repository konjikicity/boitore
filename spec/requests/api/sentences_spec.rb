require 'rails_helper'

RSpec.describe "Api::Sentences", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/sentences/index"
      expect(response).to have_http_status(:success)
    end
  end

end
