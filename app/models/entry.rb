class Entry < ApplicationRecord
  # Remember to create a migration!
  validates :body, :presence => true
  validates :title, :presence => true

  has_many :taggings
  has_many :tags, {through: :taggings}
end
