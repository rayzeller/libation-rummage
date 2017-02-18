class AddIndexToLibations < ActiveRecord::Migration
  def change
    add_index :libations, :query
  end
end
