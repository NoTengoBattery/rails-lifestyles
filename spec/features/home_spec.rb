RSpec.describe "Home", type: :system do
  describe "page" do
    let (:user) { FactoryBot.create(:user) }
    let (:category) { FactoryBot.create(:category) }
    let (:featured) { FactoryBot.build(:article) }

    def build_featured
      featured.AuthorId = user.id
      featured.categories << category
      featured.save
      vote = user.votes.build
      vote.ArticleId = featured.id
      vote.save
      byebug
      rescue ActiveRecord::RecordInvalid
        retry
    end

    it "does not fail if no articles are present" do
      visit root_path
    end

    it "shows a featured article in the view" do
      build_featured
      visit root_path
      p page.html
      link = find("#div-featured")
    end
  end
end
