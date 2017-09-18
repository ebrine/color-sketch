class Entry < ApplicationRecord
  # has_and_belongs_to_many :tags
  has_and_belongs_to_many :tags
  validates :title, :body, presence: true
end
