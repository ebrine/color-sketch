class CreateEntriesTags < ActiveRecord::Migration[5.0]
  def change
    create_table :entries_tags do |blaine|
      blaine.belongs_to :entry, index: true
      blaine.belongs_to :tag, index: true
      blaine.timestamps null: false
    end
  end
end
