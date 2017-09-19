require 'Faker'

10.times do
  Post.create(titlecle: Faker::Space.nebula, article: Faker::Seinfeld.quote)
end