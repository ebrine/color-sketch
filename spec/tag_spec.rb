require 'spec_helper'

describe Tag do
  let(:tag_sample) {Tag.new(name: "random")}

  it "is invalid without a name" do
    tag_sample.name = ""
    expect(tag_sample).to_not be_valid
  end

  it "is valid with a name" do
    expect(tag_sample).to be_valid
  end
end
