class Tagging < ApplicationRecord
  # Remember to create a migration!
  belongs_to :entry
  belongs_to :tag

  validates :entry_id, uniqueness: {scope: :tag_id}
  validates :tag_id, uniqueness: {scope: :entry_id}
end
