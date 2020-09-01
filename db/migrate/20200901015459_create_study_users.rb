class CreateStudyUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :study_users do |t|
      t.references :study, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
