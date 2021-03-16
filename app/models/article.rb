class Article < ApplicationRecord
  validates_presence_of :AuthorId
  validates_presence_of :CreatedAt
  validates_presence_of :Image
  validates_presence_of :Text
  validates :Text, length: { minimum: 100 }
  validates_presence_of :Title
  validates_uniqueness_of :Title, scope: :AuthorId
  validates :Title, length: { minimum: 10, maximum: 100 }

  belongs_to :user, foreign_key: :AuthorId
  has_many :votes, foreign_key: :ArticleId
  has_and_belongs_to_many :categories
end
