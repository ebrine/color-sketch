class Tag < ApplicationRecord
  validates :description, { presence: true }
  has_many :entries, through: :entries_tags
end
