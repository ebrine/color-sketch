require 'Faker'

authors = []

7.times { authors << Faker::Book.author }

20.times do |entry|
  Entry.create(title: Faker::Book.title, body: Faker::Hipster.paragraph(2, true), author: authors.sample)
end
