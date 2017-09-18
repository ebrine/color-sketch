class Entry < ApplicationRecord
  has_many :tags

  validates :title, :body, presence: true
  validates :author, default: "Nick"
end
