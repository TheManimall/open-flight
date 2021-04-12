class Airline < ApplicationRecord
  has_many :reviews
  belongs_to :user

  scope :popular, -> { where("popular > 5") }

  validate :not_abc
  
  before_create :slugify

  def slugify
    self.slug = name.parameterize
  end

  def avg_score
    return 0 unless reviews.count.positive?

    reviews.average(:score).round(2).to_f
  end

  def name_reverse
    name.reverse
  end

  private

  def not_abc
    if name == "ABC"
      errors.add(:name, "should not be ABC")
    end
  end
end
