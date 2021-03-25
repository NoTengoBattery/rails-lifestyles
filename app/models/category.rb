class Category < ApplicationRecord
  validates_presence_of :Name
  validates_uniqueness_of :Name
  validates :Name, length: { minimum: 4, maximum: 50 }
  validates_presence_of :Priority
  validates_uniqueness_of :Priority
  validates :Priority, numericality: { only_integer: true, greater_than: 0 }

  has_and_belongs_to_many :articles, dependent: :destroy

  scope :n1, -> { includes(:articles) }
  scope :ordered_categories, -> { order(Priority: :desc) }
  scope :top_categories, -> { ordered_categories.n1.select { |x| x.articles.size >= 1 } }

  def most_recent_article
    self.articles.order(CreatedAt: :desc).first
  end
end
