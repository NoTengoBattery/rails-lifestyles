class Article < ApplicationRecord
  validates_presence_of :AuthorId
  validates_presence_of :CreatedAt
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

  has_one_attached :image

  validate :acceptable_image

  def acceptable_image
    return unless image.attached?

    unless image.byte_size <= 5.megabyte
      errors.add(:image, "is too big, must be less than 5 megabytes")
    end

    acceptable_types = ["image/jpeg", "image/png", "image/gif"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, "must be a GIF, JPEG or PNG")
    end
  end
end
