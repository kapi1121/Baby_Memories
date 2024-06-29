class CreateDiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :diaries do |t|
      t.references :baby, null: false, foreign_key: true
      t.date :entry_date, null: false
      t.text :content,    null: false
      t.string :photo

      t.timestamps
    end
  end
end
