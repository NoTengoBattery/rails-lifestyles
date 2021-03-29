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

  scope :n1, -> { with_attached_image }
  scope :n2, -> { n1.includes([:user]) }
  scope :featured, -> {
    joins(:categories, :votes).order(votes_count: :desc, created_at: :desc, Priority: :desc).n1.first }
  scope :of_category, ->(c) { joins(:categories).where("category_id=?", c).n2 }
  scope :recent, -> { order(created_at: :desc).distinct.n1 }
  scope :top, -> (t) { joins(:votes).order(votes_count: :desc, created_at: :desc).limit(t).n1 }

  has_one_attached :image

  validate :acceptable_image

  def acceptable_image
    unless image.attached?
      errors.add(:image, I18n.t("errors.messages.blank"))
      return
    end

    unless image.byte_size <= 5.megabyte
      errors.add(:image, I18n.t("errors.messages.oversize", size: "5 MB"))
    end

    acceptable_types = ["image/jpeg", "image/png", "image/tiff"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, I18n.t("errors.messages.format", formats: "JPG, PNG, TIFF"))
    end
  end
end
