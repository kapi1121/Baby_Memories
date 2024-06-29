class CreateAdvices < ActiveRecord::Migration[7.0]
  def change
    create_table :advices do |t|
      t.integer :age_months, null: false
      t.text :advice,        null: false

      t.timestamps
    end
  end
end
