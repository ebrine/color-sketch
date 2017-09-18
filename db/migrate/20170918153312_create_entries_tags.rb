class CreateEntriesTags < ActiveRecord::Migration[5.0]
  def change
    create_table :entries_tags do |t|
      t.belongs_to :entry
      t.belongs_to :tag
    end

  end
end
