class CreateEntriesTags < ActiveRecord::Migration[5.0]
  def change
    create_table :entries_tags do |t|
      t.integer :entry_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
