class CreateAdvices < ActiveRecord::Migration[7.0]
  def change
    create_table :advices do |t|
      t.integer :age_months
      t.text :advice

      t.timestamps
    end
  end
end
