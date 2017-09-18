class Tag < ApplicationRecord
  has_many :entries, through: :entries_tags
end
