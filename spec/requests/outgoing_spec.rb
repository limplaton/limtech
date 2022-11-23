require 'rails_helper'

RSpec.describe "Outgoings", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/outgoing/index"
      expect(response).to have_http_status(:success)
    end
  end

end
