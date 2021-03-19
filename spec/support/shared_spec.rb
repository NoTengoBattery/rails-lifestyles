RSpec.shared_examples "build valid article with vote" do
  let (:user) { FactoryBot.create(:user) }
  let (:category) { FactoryBot.create(:category) }
  let (:featured) { FactoryBot.build(:article) }

  before do
    build_featured
  end

  def build_featured
    featured.AuthorId = user.id
    featured.categories << category
    featured.save!
    vote = user.votes.build
    vote.ArticleId = featured.id
    vote.save!
  rescue ActiveRecord::RecordInvalid
    retry
  end
end
