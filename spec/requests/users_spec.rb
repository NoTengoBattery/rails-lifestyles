require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "GET /sign_up" do
    it "returns HTTP OK and renders the sign_up template" do
      get "/sign_up"
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:sign_up)
    end
  end

  describe "GET /sign_in" do
    it "returns HTTP OK and renders the sign_in template" do
      get "/sign_in"
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:sign_in)
    end
  end

  describe "GET /sign_out" do
    it "returns HTTP OK and renders the sign_out template" do
      get "/sign_out"
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:sign_out)
    end
  end

  describe "GET /edit" do
    it "returns HTTP OK and renders the edit template" do
      get "/users/:id/edit"
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:edit)
    end
  end

  describe "GET /show" do
    it "returns HTTP OK and renders the show template" do
      get "/users/:id"
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end

  describe "POST /users" do
    it "creates a new user and redirects to it's show page" do
      user = FactoryBot.build(:user)
      post "/users", params: { user: { Name: user.Name } }
      cookie_jar = ActionDispatch::Cookies::CookieJar.build(request, response.cookies)
      expect(cookie_jar.encrypted["session_user"]).to be_integer
      expect(response).to redirect_to(assigns(:user))

      follow_redirect!
      expect(response).to render_template(:show)
      expect(response.body).to include(I18n.t("user.notice.sign_up"))
    end
    it "rejects an invalid new user and renders the form again" do
      post "/users", params: { user: { Name: nil } }
      cookie_jar = ActionDispatch::Cookies::CookieJar.build(request, response.cookies)
      expect(cookie_jar.encrypted["session_user"]).to be_nil

      expect(response).not_to redirect_to(assigns(:user))
      expect(response).to render_template(:sign_up)
      expect(response.body).to include(I18n.t("user.alert.sign_up"))
    end
  end
end
