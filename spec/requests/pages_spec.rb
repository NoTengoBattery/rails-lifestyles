require "rails_helper"

RSpec.describe "Pages", type: :request do
  describe "GET /home" do
    include_examples "build valid article with vote"

    it "returns http success" do
      get home_path
      expect(response).to have_http_status(:success)
    end
  end
end
