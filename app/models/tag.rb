class Tag < ApplicationRecord
  has_many :joins
  has_many :entries, through: :joins
  validates :tag_name, presence: true
end
