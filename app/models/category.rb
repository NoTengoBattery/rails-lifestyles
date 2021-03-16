class Category < ApplicationRecord
  validates_presence_of :Name
  validates_uniqueness_of :Name
  validates :Name, length: { minimum: 4 }
  validates_presence_of :Priority
  validates_uniqueness_of :Priority
  validates :Priority, numericality: { only_integer: true, greater_than: 0 }

  has_and_belongs_to_many :articles
end
