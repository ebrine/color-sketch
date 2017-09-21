require 'Faker'

20.times do |entry|
  Entry.create(title: Faker::Book.title, body: Faker::Hipster.paragraph(2, true), author: Faker::Book.author)
end
