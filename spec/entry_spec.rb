require 'spec_helper'

describe Entry do
  let (:string_dreaming) { Tag.create(tag_name: "Dreaming") }
  let (:entry) { Entry.create({title: "My Mundane Life", body: "I woke up, went back to sleep, ate cereal... in my dreams... woke up again, end of day.", tags: [string_dreaming]}) }


  it "can belong to many tags" do
    t = Tag.create(tag_name: "Bed")
    entry.tags << t
    expect(entry.tags.all.pluck(:tag_name)).to match_array ["Dreaming", "Bed"]
  end
  it "it has to belong to at least one tag" do
    expect(entry.tags.all.first).to eq(string_dreaming)
  end
  it "it has to have a title" do
    expect(entry.title).to eq("My Mundane Life")
  end
  it "cannot have no title" do
    entry = Entry.new( { body: "Cher is a wonderful artist.", tags: [string_dreaming]})
    expect(entry).to_not be_valid
  end
  it "it has to have a body" do
    expect(entry.body).to eq("I woke up, went back to sleep, ate cereal... in my dreams... woke up again, end of day.")
  end
  it "cannot have no body" do
    entry = Entry.new({title: "Cher", tags:[string_dreaming]})
    expect(entry).to_not be_valid
  end
end
