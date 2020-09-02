class CreateStudies < ActiveRecord::Migration[6.0]
  def change
    create_table :studies do |t|
      t.bigint :owner_id 
      t.string :name
      t.text :introduce
      t.string :image
      t.string :tool, null: false
      t.integer :category, null: false
      t.time :end_at, null: false
      t.timestamps
    end
  end
end
