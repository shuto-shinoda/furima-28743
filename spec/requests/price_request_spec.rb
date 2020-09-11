require 'rails_helper'

RSpec.describe "Prices", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/price/index"
      expect(response).to have_http_status(:success)
    end
  end

end
