class AddMessageBoxToRecipients < ActiveRecord::Migration
  def change
    add_reference :recipients, :message_box, index: true
  end
end
