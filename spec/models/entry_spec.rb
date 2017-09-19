require 'spec_helper'

describe Entry do
  let(:entry) {Entry.create}
  describe 'associations' do
    it 'has many tags' do
      expect(entry.tags).to be_an(ActiveRecord::Relation)
    end
    it 'has many entry_tags' do
      expect(entry.entries_tags).to be_an(ActiveRecord::Relation)
    end
  end
end
