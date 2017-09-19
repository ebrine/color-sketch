class Post < ApplicationRecord
  has_many :joins
  has_many :tags, through: :joins

  validates :article, :presence => true
  validates :title, :presence => true
end
