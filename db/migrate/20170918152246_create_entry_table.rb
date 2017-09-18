class CreateEntryTable < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :title
      t.string :article
      t.integer :blog_id

      t.timestamps
    end
  end
end
