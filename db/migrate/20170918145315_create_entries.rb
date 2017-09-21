class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :body, null: false
      t.string :title, null: false
      t.string :author, default: 'ANON'

      t.timestamps
    end
  end
end
