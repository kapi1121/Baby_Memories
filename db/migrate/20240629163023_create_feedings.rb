class CreateFeedings < ActiveRecord::Migration[7.0]
  def change
    create_table :feedings do |t|
      t.references :baby, null: false, foreign_key: true
      t.datetime :feeding_time
      t.integer :amount

      t.timestamps
    end
  end
end
