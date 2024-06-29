class CreateBabies < ActiveRecord::Migration[7.0]
  def change
    create_table :babies do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name,     null: false
      t.date :birth_date, null: false
      t.float :height
      t.float :weight

      t.timestamps
    end
  end
end
