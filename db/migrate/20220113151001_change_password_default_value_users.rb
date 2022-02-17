class ChangePasswordDefaultValueUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :password, :string, default: ""
  end
end
