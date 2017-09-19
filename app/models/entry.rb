class Entry < ApplicationRecord
  has_and_belongs_to_many :tags
  validates :title, :description, presence: true
end
