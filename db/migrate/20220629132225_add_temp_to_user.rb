class AddTempToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :temp, :integer
  end
end
