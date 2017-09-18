class CreateEntryTagJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :entries_tags do |t|
      t.integer :entry_id
      t.integer :tag_id
    end
  end
end
