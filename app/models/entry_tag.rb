class EntryTag < ApplicationRecord
  has_many :entries
  has_many :tags
end
