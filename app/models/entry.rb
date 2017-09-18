class Entry < ApplicationRecord
  has_many :joins
  has_many :tags, through: :joins
  validates :tags, :body, :title, presence: true
end
