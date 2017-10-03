require 'spec_helper'

describe EntriesTag do
  let!(:entry) { Entry.create!(title: "Ham", description: "llama") }
  let!(:tag) { Tag.create!(name: "Pudentaine") }
  let!(:entries_tag) { EntriesTag.create!(entry: entry, tag: tag) }

  describe 'associations' do
    it 'belongs to entry' do
      expect(entries_tag.entry).to be entry
    end

    it 'belongs to tag' do
      expect(entries_tag.tag).to be tag
    end
  end

  # it 'can be deleteD' do
  #   entry.tags.delete(entries_tag)
  #   expect(EntriesTag.all).to not_include(entries_tag)
  # end

  it 'can be deleted' do
    p entry.tags
    expect{ entry.tags.delete(tag) }.to change { EntriesTag.count }.by -1
    p '*' * 20
    p Tag.all
  end


end
