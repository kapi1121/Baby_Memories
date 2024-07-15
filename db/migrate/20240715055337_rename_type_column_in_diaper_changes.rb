class RenameTypeColumnInDiaperChanges < ActiveRecord::Migration[7.0]
  def change
    rename_column :diaper_changes, :type, :change_type
  end
end
