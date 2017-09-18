require 'spec_helper'

describe Join do
  it "can return an entry" do
    e = Entry.create({title: "My Mundane Life 2", body: "Some Cher", tags: [Tag.new({tag_name: "Anything"})]})
    expect(Join.all.find_by(entry_id: e.id)).to_not be nil
  end
  it "can return a tag" do
    e = Entry.create({title: "My Mundane Life 2", body: "Some Cher", tags: [Tag.new({tag_name: "Anything"})]})
    expect(Join.all.find_by(tag_id: e.id)).to_not be nil
  end
end
