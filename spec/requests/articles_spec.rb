require "rails_helper"

RSpec.describe "Articles", type: :request do
  context "requests" do
    include_examples "build valid article with vote"

    describe "GET /show" do
      it "returns HTTP OK and renders the show template" do
        get article_path(user)
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:show)
      end
    end
  end
end
