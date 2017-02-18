class CreateLibations < ActiveRecord::Migration
  def change
    create_table :libations do |t|
      t.string :query
      t.timestamps null: false
    end
  end
end
