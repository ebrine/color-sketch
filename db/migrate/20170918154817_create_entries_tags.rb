class CreateEntriesTags < ActiveRecord::Migration[5.0]
  def change
    create_table :entries_tags do |t|
      t.integer :entries_id
      t.integer :tags_id
    end
  end
end
