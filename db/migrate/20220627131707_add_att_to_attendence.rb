class AddAttToAttendence < ActiveRecord::Migration[5.2]
  def change
    add_column :attendences, :attendence, :integer
  end
end
