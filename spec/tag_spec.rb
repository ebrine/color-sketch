require 'spec_helper'

describe Tag do
  let (:tag) {Tag.create({tag_name: ["1"]})}
  it "it can have many entries" do

  end
  it "name cannot be blank" do
    t = Tag.new({tag_name: nil})
    expect(t).to_not be_valid
  end
  it "it must have a title"
  it "tags must be at least one" do
    Tag.create({tag_name: "Cher"})
    expect(Tag.count > 0).to eq true
    expect(Tag.all.pluck(:tag_name)).to include("Cher")
  end
end
