class AddDeletedAtToStudies < ActiveRecord::Migration[6.0]
  def change
    add_column :studies, :deleted_at, :datetime
    add_index :studies, :deleted_at
  end
end
