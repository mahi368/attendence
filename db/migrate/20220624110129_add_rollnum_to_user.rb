class AddRollnumToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :enrollment_number, :string
  end
end
