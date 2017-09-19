class CreateEntriesTags < ActiveRecord::Migration[5.0]
  def change
    create_table :entries_tags do |blaine|
      blaine.belongs_to :entry
      blaine.belongs_to :tag
      blaine.timestamps null: false
    end
  end
end
