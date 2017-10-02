class Entry < ApplicationRecord
  has_many :tags, through: :entries_tags
  has_many :entries_tags
  validates :title, :description, presence: true

end
