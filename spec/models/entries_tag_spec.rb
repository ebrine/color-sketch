require 'spec_helper'

describe EntriesTag do
  let(:entry) {Entry.create}
  let(:tag) {Tag.create}
  let(:entry_tag) {EntriesTag.create(entry_id: entry.id, tag_id: tag.id)}
  describe 'associations' do
    it 'belongs to an entry' do
      expect(entry_tag.tag).to eq(tag)
    end
    it 'belongs to a tag' do
      expect(entry_tag.entry).to eq(entry)
    end
  end
end
