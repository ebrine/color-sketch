require 'spec_helper'

describe Tag do
  let(:tag) { Tag.create(name: 'party') }
  describe 'associations' do
    it 'has many entries' do
      expect(tag.entries).to be_an(ActiveRecord::Relation)
    end
    it 'has many entry_tags' do
      expect(tag.entries_tags).to be_an(ActiveRecord::Relation)
    end
  end
  describe 'validations' do
    it 'is valid with a name' do
      expect(tag).to be_valid
    end
    it 'is invalid without a name' do
      tag.name = nil
      expect(tag).to_not be_valid
    end
  end
end
