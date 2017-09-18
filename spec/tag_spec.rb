require 'spec_helper'

describe Tag do
  let (:tag) {Tag.create({tag_name: "1"})}
  it "it can have many entries" do
    Entry.create({title: "Cher", body: "Cher is a wonderful person", tags: [tag]})
    Entry.create({title: "Americano", body: "Papa americano!", tags: [tag]})
    expect(tag.entries.all.pluck(:title)).to eq(["Cher", "Americano"])
  end
  it "name cannot be blank" do
    t = Tag.new({tag_name: nil})
    expect(t).to_not be_valid
  end
  it "has a tag name" do
    expect(tag.tag_name).to eq("1")
  end
  it "tags must be at least one" do
    Tag.create({tag_name: "Cher"})
    expect(Tag.count > 0).to eq true
    expect(Tag.all.pluck(:tag_name)).to include("Cher")
  end
end
