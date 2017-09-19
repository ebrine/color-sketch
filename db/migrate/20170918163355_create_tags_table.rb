class CreateTagsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name, { null: false, limit: 30 }

      t.timestamps
    end
  end
end
