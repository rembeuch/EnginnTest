class AddNumberToPage < ActiveRecord::Migration[6.1]
  def change
        add_column :pages, :number, :integer, :default => 10
  end
end
