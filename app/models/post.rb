class Post < ApplicationRecord
  has_many :joins
  has_many :tags, through: :joins
end
