require 'spec_helper'

describe Entry do
  let(:entry_sample) {Entry.new(
    title: "Something Good",
    body: "Lorem ipsum whatever")}

  it "is not valid without a title" do
    entry_sample.title = ""
    expect(entry_sample).to_not be_valid
  end

  it "is not valid without a body" do
    entry_sample.body = ""
    expect(entry_sample).to_not be_valid
  end

  it "is valid with both a title and a body" do
    expect(entry_sample).to be_valid
  end
end
