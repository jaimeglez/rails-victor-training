class AddDetailsToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :username, :string
    add_column :admins, :role, :string
  end
end
