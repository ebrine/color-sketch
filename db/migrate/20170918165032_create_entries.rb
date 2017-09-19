class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :title, {:presence => true, limit: 60}
      t.string :body, {:presence => true}

      t.timestamps
    end
  end
end
