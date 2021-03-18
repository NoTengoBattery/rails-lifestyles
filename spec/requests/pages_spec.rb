require "rails_helper"

RSpec.describe "Pages", type: :request do
  describe "GET /home" do
    it "returns http success" do
      pending("Change the article link to the actual link")
      get "/pages/home"
      expect(response).to have_http_status(:success)
    end
  end
end
