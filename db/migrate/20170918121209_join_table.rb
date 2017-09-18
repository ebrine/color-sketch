class JoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :joins do |t|
      t.integer :entry_id
      t.integer :tag_id
    end
  end
end
