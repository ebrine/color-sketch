class Entry < ApplicationRecord
  has_many :tags, through: :entries_tags
  validates :body, presence: true
  validates :title, presense: true
end
