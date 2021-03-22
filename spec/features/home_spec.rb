require "rails_helper"
require "shared_rutines"

RSpec.describe "Home", type: :system do
  describe "page" do
    include_examples "build valid article with vote"

    it "shows a featured article in the view" do
      visit root_path
      featured_tag = find("#div-featured")
      expect(featured_tag).to have_content(featured.Title)
    end

    it "shows the article's categories in the view" do
      visit root_path
      featured_tag = find("#div-category-1")
      expect(featured_tag).to have_content(featured.Title)
    end
  end
end
