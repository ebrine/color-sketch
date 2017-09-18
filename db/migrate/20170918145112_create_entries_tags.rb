class CreateEntriesTags < ActiveRecord::Migration[5.0]
  def change
    create_table :entries_tags do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :entry, index: true
    end
  end
end
