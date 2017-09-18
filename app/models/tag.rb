class Tag < ApplicationRecord
  has_many :joins
  has_many :entries, through: :joins
end
