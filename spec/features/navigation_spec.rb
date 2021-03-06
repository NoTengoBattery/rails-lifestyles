require "rails_helper"
require "shared_rutines"

RSpec.describe "Navigation", type: :system do
  describe "link" do
    include_examples "build valid article with vote"

    before do
      visit root_path
    end

    def find_and_test_link(selector, text, href)
      link = find(selector)
      expect(link.text).to eq(text)
      expect(link["href"]).to eq(href)
    end

    it "shows the brand link" do
      find_and_test_link(".navbar-brand", I18n.t("name"), root_path)
    end
    it "shows the home link" do
      find_and_test_link("#home", I18n.t("home"), home_path)
    end
    it "shows the write new article link" do
      find_and_test_link("#write", I18n.t("article.write"), new_article_path)
    end
    it "shows the sign up link when guest" do
      find_and_test_link("#user-link-1", I18n.t("user.sign_up"), sign_up_path)
    end
    it "shows the sign in link when guest" do
      find_and_test_link("#user-link-2", I18n.t("user.sign_in"), sign_in_path)
    end
    it "shows the self user profile link when signed in" do
      user = sign_up_rutine
      find_and_test_link("#user-link-1", user.Name, user_path(user.id))
    end
    it "shows the sign out link when signed in" do
      sign_up_rutine
      find_and_test_link("#user-link-2", I18n.t("user.sign_out"), sign_out_path)
    end
  end
end
