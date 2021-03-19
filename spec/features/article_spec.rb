RSpec.describe "Article", type: :system do
  describe "feature" do
    include_examples "build valid article with vote"

    it "shows the article title" do
      visit article_path(featured)
      featured_title = find("h1")
      expect(featured_title).to have_content(featured.Title)
    end
  end
end
