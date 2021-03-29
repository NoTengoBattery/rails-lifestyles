require "rails_helper"
require "shared_rutines"

RSpec.describe "Article", type: :system do
  describe "details" do
    include_examples "build valid article with vote"

    it "shows the article title" do
      sign_up_rutine
      visit article_path(featured)
      article_title = find("h1")
      expect(article_title).to have_content(featured.Title)
    end

    it "shows the article author" do
      sign_up_rutine
      visit article_path(featured)
      article_author = find("#author")
      expect(article_author).to have_content(user.Name)
    end

    it "shows the votes count" do
      sign_up_rutine
      visit article_path(featured)
      article_votes = find("#votes")
      expect(article_votes).to have_content(featured.votes.size)
    end

    it "shows the date of creation" do
      sign_up_rutine
      visit article_path(featured)
      article_date = find("#date")
      expect(article_date).to have_content(I18n.l(featured.CreatedAt))
    end

    it "shows the text" do
      sign_up_rutine
      visit article_path(featured)
      article_text = find("#text")
      expect(article_text).to have_content(featured.Text)
    end
  end
end
