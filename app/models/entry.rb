class Entry < ApplicationRecord
  has_many :entries_tags
  has_many :tags, through: :entries_tags
end
