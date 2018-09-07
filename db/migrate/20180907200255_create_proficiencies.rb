class CreateProficiencies < ActiveRecord::Migration[5.1]
  def change
    create_table :proficiencies do |t|
      t.references :user, foreign_key: true
      t.references :language, foreign_key: true
      t.integer :proficiency_level

      t.timestamps
    end
  end
end
