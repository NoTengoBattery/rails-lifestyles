require "rails_helper"

RSpec.describe Category, type: :model do
  context "validations" do
    subject { FactoryBot.build(:category) }
    it { should validate_presence_of(:Name) }
    it { should validate_uniqueness_of(:Name) }
    it { should validate_presence_of(:Priority) }
    it { should validate_uniqueness_of(:Priority) }
  end
  context "associations" do
    subject { FactoryBot.build(:category) }
    it { should have_many(:articles) }
  end
end
