class Tag < ApplicationRecord
  # Remember to create a migration!
  validates :name, :presence => true

  has_many :taggings
  has_many :entries, {through: :taggings}
end
