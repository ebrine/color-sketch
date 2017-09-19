class Entry < ApplicationRecord
  validates :title, :body, :author, presence: true
  has_many :entries_tags
  has_many :tags, through: :entries_tags
end
