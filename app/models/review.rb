class Review < ApplicationRecord
  belongs_to :airline

  validates :title, presence: true
end
