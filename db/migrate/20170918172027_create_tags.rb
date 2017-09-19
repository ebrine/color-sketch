class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :description, {:presence => true, limit: 60}

      t.timestamps
    end
  end
end
