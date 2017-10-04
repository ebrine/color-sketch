class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :name
      t.string :author
      t.string :content
    end
  end
end
