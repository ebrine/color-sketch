class Tag < ApplicationRecord
  has_many :joins
  has_many :posts, through: :joins
end
