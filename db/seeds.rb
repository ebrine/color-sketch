require 'Faker'

# 20.times do |entry|
#   Entry.create(title: Faker::Book.title, body: Faker::Hipster.paragraph(2, true), author: Faker::Book.author)
# end
#
# TAGS = ["Dispair", "Utter Repulsion", "Existential crisis gripping the 'youth' of 'America'", "Anxiety"]
#
# TAGS.each do |tag|
#   Tag.create(name: tag)
# end

62.times do
  begin
    Tag.all.sample.entries << Entry.all.sample
  rescue => e
    puts e
  end
end
