require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /sign_up" do
    it "returns http success" do
      get "/users/sign_up"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /sign_in" do
    it "returns http success" do
      get "/users/sign_in"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /sign_out" do
    it "returns http success" do
      get "/users/sign_out"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/users/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/users/show"
      expect(response).to have_http_status(:success)
    end
  end

end
