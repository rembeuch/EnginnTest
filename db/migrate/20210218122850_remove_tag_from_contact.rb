class RemoveTagFromContact < ActiveRecord::Migration[6.1]
  def change
    remove_column :contacts, :tag
  end
end
