class ChangeNicknameInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :nickname, :string, null: false, default: ""
  end
end
