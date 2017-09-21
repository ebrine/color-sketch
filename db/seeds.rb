
require 'faker'

20.times do
  Entry.create( {title: Faker::Pokemon.location, body: Faker::Lorem.paragraph(2) })
end

tags = ['dogs', 'cats', 'summer', 'winter', 'autumn', 'leaves', 'bunnies']

all_entries = Entry.all

all_entries.each do |entry|
  entry.tags << Tag.create(category: tags.sample)
end