class CreateStudies < ActiveRecord::Migration[6.0]
  def change
    create_table :studies do |t|
      t.bigint :owner_id 
      t.string :name
      t.text :introduce
      t.string :image
      t.string :url, null: false
      t.integer :tool_id, null: false
      t.integer :category_id, null: false
      t.time :end_at, null: false
      t.timestamps
    end
  end
end
