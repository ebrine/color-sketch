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

  describe 'validations' do
    let(:entry) {Entry.new(title: 'Ham', author: 'Hammstein', body: 'Hams')}
    context 'validates presence of' do
      describe 'title' do
        it 'is valid with a title' do
          expect(entry).to be_valid
        end
        it 'is invalid without a title' do
          entry.title = nil
          expect(entry).to_not be_valid
        end
      end
      describe 'body' do
        it 'is valid with a body' do
          expect(entry).to be_valid
        end
        it 'is invalid without a body' do
          entry.body = nil
          expect(entry).to_not be_valid
        end
      end
      describe 'author' do
        it 'is valid with a author' do
          expect(entry).to be_valid
        end
        it 'is invalid without a author' do
          entry.author = nil
          expect(entry).to_not be_valid
        end
      end
    end
  end
end
