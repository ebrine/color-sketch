class Tag < ApplicationRecord
  # Remember to create a migration!
  has_and_belongs_to_many :entries
  validates :name, :presence => true
end
