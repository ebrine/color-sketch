class EntryTable < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.timestamps
    end
  end
end
