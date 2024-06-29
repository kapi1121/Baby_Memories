class CreateDiaperChanges < ActiveRecord::Migration[7.0]
  def change
    create_table :diaper_changes do |t|
      t.references :baby, null: false, foreign_key: true
      t.datetime :change_time
      t.string :type

      t.timestamps
    end
  end
end
