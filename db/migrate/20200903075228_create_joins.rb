class CreateJoins < ActiveRecord::Migration[6.0]
  def change
    create_table :joins do |t|
      t.references :user
      t.references :study, null: false, foreign_key: true, index: false

      t.timestamps
    end

    add_index :joins, %i[study_id user_id], unique: true
  end
end
