class CreateJoins2 < ActiveRecord::Migration[5.0]
  def change
    create_table :joins do |t|
      t.belongs_to :post
      t.belongs_to :tag

    end
  end
end
