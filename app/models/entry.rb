class Entry < ApplicationRecord
  has_many :tags, through: :entries_tags
end
