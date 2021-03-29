class Vote < ApplicationRecord
  validates_presence_of :ArticleId
  validates_presence_of :UserId
  validates_uniqueness_of :ArticleId, scope: :UserId

  belongs_to :article, foreign_key: :ArticleId, counter_cache: true
  belongs_to :user, foreign_key: :UserId, counter_cache: true

  scope :n1, -> { includes(:user, :article) }
  scope :of_user, ->(u) { where(user: u).n1 }
end
