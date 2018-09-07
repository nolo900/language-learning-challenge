class CreateLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :languages do |t|
      t.string :name
      t.decimal :avg_proficiency

      t.timestamps
    end
  end
end
