class AddAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_admin, :boolean, default: false, null: false
    add_column :users, :is_developer, :boolean, default: false, null: false
  end
end
