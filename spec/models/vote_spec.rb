require "rails_helper"

RSpec.describe Vote, type: :model do
  context "validations" do
    subject { FactoryBot.build(:vote) }
    it { should validate_presence_of(:ArticleId) }
    it { should validate_uniqueness_of(:ArticleId).scoped_to(:UserId) }
    it { should validate_presence_of(:UserId) }
  end
  context "associations" do
    subject { FactoryBot.build(:vote) }
    it { should belong_to(:article) }
    it { should belong_to(:user) }
  end
end
