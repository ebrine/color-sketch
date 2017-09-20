class Tag < ApplicationRecord
  validates :description, { presence: true }
  has_many :entry_tags
  has_many :entries, through: :entry_tags
end
