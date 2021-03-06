require "rails_helper"
require "shared_rutines"

RSpec.describe Article, type: :model do
  context "validations" do
    subject { FactoryBot.build(:article) }
    it { should validate_presence_of(:AuthorId) }
    it { should validate_presence_of(:Title) }
    it { should validate_uniqueness_of(:Title).scoped_to(:AuthorId) }
    it { should validate_length_of(:Title).is_at_least(4).is_at_most(150) }
    it { should validate_presence_of(:Text) }
    it { should validate_length_of(:Text).is_at_least(100) }
    it { should validate_presence_of(:CreatedAt) }
    it { should validate_presence_of(:categories) }
  end
  context "associations" do
    subject { FactoryBot.build(:article) }
    it { should belong_to(:user) }
    it { should have_many(:votes) }
    it { should have_and_belong_to_many(:categories) }
  end
end
