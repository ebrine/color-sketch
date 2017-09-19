require 'spec_helper'

describe Tag do
  let(:tag) { Tag.create }
  describe 'associations' do
    it 'has many entries' do
      expect(tag.entries).to be_an(ActiveRecord::Relation)
    end
  end
end
