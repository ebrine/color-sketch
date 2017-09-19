require 'Faker'

10.times do
  Post.create(title: Faker::Space.nebula, article: Faker::Seinfeld.quote)
end