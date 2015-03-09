class AddEmailNotifToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_notif, :boolean
  end
end
