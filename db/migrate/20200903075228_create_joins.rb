class CreateJoins < ActiveRecord::Migration[6.0]
  def change
    create_table :joins do |t|
      t.references :user
      t.references :study, null: false, foreign_key: true
      t.timestamps
    end

    add_index :joins, :user_id, unique: true
  end
end
