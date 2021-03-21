class Article < ApplicationRecord
  validates_presence_of :AuthorId
  validates_presence_of :CreatedAt
  validates_presence_of :Image
  validates_presence_of :Text
  validates :Text, length: { minimum: 100 }
  validates_presence_of :Title
  validates_uniqueness_of :Title, scope: :AuthorId
  validates :Title, length: { minimum: 4, maximum: 150 }
  validates_presence_of :categories

  belongs_to :user, foreign_key: :AuthorId, counter_cache: true
  has_many :votes, foreign_key: :ArticleId, dependent: :destroy
  has_and_belongs_to_many :categories

  scope :featured, -> { joins(:votes).order(votes_count: :desc).first }
  scope :recent, -> { order(CreatedAt: :desc) }
end
