require 'spec_helper'

describe Tag do
  let(:tag_sample) {Tag.new(name: "random")}

  pending "is invalid without a name" do
    tag_sample.name = ""
    expect(tag_sample).to_not be_valid
  end

  pending "is valid with a name" do
    expect(tag_sample).to be_valid
  end
end
