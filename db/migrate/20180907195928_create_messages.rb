class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :sender, foreign_key: true
      t.references :recipient, foreign_key: true
      t.references :language, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
