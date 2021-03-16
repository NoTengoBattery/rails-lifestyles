class User < ApplicationRecord
  validates_presence_of :Name
  validates_uniqueness_of :Name
  validates :Name, length: { minimum: 6 }

  has_many :votes, foreign_key: :UserId, dependent: :destroy
  has_many :articles, foreign_key: :AuthorId, dependent: :destroy
end
