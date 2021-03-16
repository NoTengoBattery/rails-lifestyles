require "rails_helper"

RSpec.describe Category, type: :model do
  context "validations" do
    subject { FactoryBot.build(:category) }
    it { should validate_presence_of(:Name) }
    it { should validate_uniqueness_of(:Name) }
    it { should validate_length_of(:Name).is_at_least(4).is_at_most(50) }
    it { should validate_presence_of(:Priority) }
    it { should validate_uniqueness_of(:Priority) }
    it { should validate_numericality_of(:Priority).only_integer.is_greater_than(0) }
  end
  context "associations" do
    subject { FactoryBot.build(:category) }
    it { should have_and_belong_to_many(:articles) }
  end
end
