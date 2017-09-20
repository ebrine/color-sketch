class EntryTag < ApplicationRecord
  belongs_to :tag
  belongs_to :entry
end
