class Tag < ApplicationRecord
  has_many :entries, through: :entries_tags
  validates :category, presence: true
end
