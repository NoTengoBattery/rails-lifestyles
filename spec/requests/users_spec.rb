require "rails_helper"
require "shared_rutines"

RSpec.describe "UsersRequests", type: :request do
  def sign_up_rutine
    user = FactoryBot.build(:user)
    post sign_up_path, params: { user: { Name: user.Name } }
    user = assigns(:user)
    expect(response).to redirect_to(user)
    user
  end

  describe "GET /sign_up" do
    it "returns HTTP OK and renders the sign_up template" do
      get sign_up_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:sign_up)
    end
  end

  describe "GET /sign_in" do
    it "returns HTTP OK and renders the sign_in template" do
      get sign_in_path
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:sign_in)
    end
  end

  describe "DELETE /sign_out" do
    it "returns HTTP Redirect status after logging out" do
      sign_up_rutine
      delete sign_out_path
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET /edit" do
    it "returns HTTP OK and renders the edit template" do
      user = sign_up_rutine
      get edit_user_path(user)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:edit)
    end
  end

  describe "GET /show" do
    it "returns HTTP OK and renders the show template" do
      user = sign_up_rutine
      get user_path(user)
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end

  describe "POST /sign_up" do
    it "creates a new user and redirects to it's show page" do
      user = FactoryBot.build(:user)
      post sign_up_path, params: { user: { Name: user.Name } }
      cookie_jar = ActionDispatch::Cookies::CookieJar.build(request, response.cookies)
      expect(cookie_jar.encrypted["session_user"]).to be_integer
      expect(response).to redirect_to(assigns(:user))

      follow_redirect!
      expect(response).to render_template(:show)
      expect(response.body).to include(I18n.t("user.notice.sign_up"))
    end
    it "rejects an invalid new user and renders the form again" do
      post sign_up_path, params: { user: { Name: nil } }
      cookie_jar = ActionDispatch::Cookies::CookieJar.build(request, response.cookies)
      expect(cookie_jar.encrypted["session_user"]).to be_nil

      expect(response).not_to redirect_to(assigns(:user))
      expect(response).to render_template(:sign_up)
      expect(response.body).to include(I18n.t("user.alert.sign_up"))
    end
  end
  describe "POST /sign_in" do
    def sign_up_and_out
      user = FactoryBot.build(:user)
      post sign_up_path, params: { user: { Name: user.Name } }
      delete sign_out_path
      user
    end
    it "creates a new user session and redirects to it's show page" do
      user = sign_up_and_out
      post sign_in_path, params: { user: { Name: user.Name } }
      expect(response).to redirect_to(assigns(:user))
    end
    it "rejects an invalid new user session and renders the form again" do
      post sign_in_path, params: { user: { Name: nil } }
      expect(response).not_to redirect_to(assigns(:user))
      expect(response).to render_template(:sign_in)
    end
  end
end
