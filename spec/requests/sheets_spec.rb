require 'rails_helper'

RSpec.describe "Sheets", type: :request do
  describe "GET /sheets" do
    it "returns http success" do
      get "/sheets/sheets"
      expect(response).to have_http_status(:success)
    end
  end

end
