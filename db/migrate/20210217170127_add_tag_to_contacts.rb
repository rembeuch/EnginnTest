class AddTagToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :tag, :boolean, :default => false
  end
end
