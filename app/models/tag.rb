class Tag < ApplicationRecord
  has_many :entries_tags
  has_many :entries, through: :entries_tags
end
