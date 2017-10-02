class UpdateEntriesAuthor < ActiveRecord::Migration[5.0]
  def change
    change_table :entries do |t|
      t.string :author, null: false
    end
  end
end
