class Entry < ApplicationRecord
  validates :title, { presence: true }
  validates :body, { presence: true }
  has_many :tags, through: :entries_tags
end
