require "rails_helper"

RSpec.describe User, type: :model do
  context "validations" do
    subject { FactoryBot.build(:user) }
    it { should validate_presence_of(:Name) }
    it { should validate_uniqueness_of(:Name) }
  end
  context "associations" do
    subject { FactoryBot.build(:user) }
    it { should have_many(:articles) }
    it { should have_many(:votes) }
  end
end
