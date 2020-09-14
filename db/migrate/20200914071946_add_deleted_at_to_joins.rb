class AddDeletedAtToJoins < ActiveRecord::Migration[6.0]
  def change
    add_column :joins, :deleted_at, :datetime
    add_index :joins, :deleted_at
  end
end
